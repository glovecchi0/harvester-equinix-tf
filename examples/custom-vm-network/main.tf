locals {
  private_ssh_key_path = var.ssh_private_key_path == null ? "${path.cwd}/${var.prefix}-ssh_private_key.pem" : var.ssh_private_key_path
  public_ssh_key_path  = var.ssh_public_key_path == null ? "${path.cwd}/${var.prefix}-ssh_public_key.pem" : var.ssh_public_key_path
}

module "harvester_equinix" {
  source               = "../../modules/infrastructure"
  prefix               = var.prefix
  create_ssh_key_pair  = var.create_ssh_key_pair
  ssh_private_key_path = local.private_ssh_key_path
  ssh_public_key_path  = local.public_ssh_key_path
  harvester_version    = var.harvester_version
  instance_count       = var.instance_count
  metal_create_project = var.metal_create_project
  project_name         = var.project_name
  organization_id      = var.organization_id
  project_id           = var.project_id
  plan                 = var.plan
  billing_cycle        = var.billing_cycle
  metro                = var.metro
  ipxe_script          = var.ipxe_script
  spot_instance        = var.spot_instance
  max_bid_price        = var.max_bid_price
  use_cheapest_metro   = var.use_cheapest_metro
  ssh_key              = var.ssh_key
  vlan_count           = var.vlan_count
  rancher_api_url      = var.rancher_api_url
  rancher_access_key   = var.rancher_access_key
  rancher_secret_key   = var.rancher_secret_key
  rancher_insecure     = var.rancher_insecure
  api_key              = var.api_key
}

resource "null_resource" "wait_harvester_services_startup" {
  depends_on = [module.harvester_equinix]
  provisioner "local-exec" {
    command     = <<-EOF
      count=0
      while [ "$${count}" -lt 15 ]; do
        resp=$(curl -k -s -o /dev/null -w "%%{http_code}" $${HARVESTER_URL}ping)
        echo "Waiting for $${HARVESTER_URL}ping - response: $${resp}"
        if [ "$${resp}" = "200" ]; then
          ((count++))
        fi
        sleep 2
      done
      EOF
    interpreter = ["/bin/bash", "-c"]
    environment = {
      HARVESTER_URL = module.harvester_equinix.harvester_url
    }
  }
}

locals {
  kc_path = var.kube_config_path != null ? var.kube_config_path : path.cwd
  kc_file = var.kube_config_filename != null ? "${local.kc_path}/${var.kube_config_filename}" : "${local.kc_path}/${var.prefix}_kube_config.yml"
}

data "local_file" "ssh_private_key" {
  depends_on = [null_resource.wait_harvester_services_startup]
  filename   = local.private_ssh_key_path
}

resource "ssh_resource" "retrieve_kubeconfig" {
  depends_on = [data.local_file.ssh_private_key]
  host       = module.harvester_equinix.seed_ip
  commands = [
    "sudo sed 's/127.0.0.1/${module.harvester_equinix.seed_ip}/g' /etc/rancher/rke2/rke2.yaml"
  ]
  user        = "rancher"
  private_key = data.local_file.ssh_private_key.content
}

resource "local_file" "kube_config_yaml" {
  depends_on      = [ssh_resource.retrieve_kubeconfig]
  filename        = local.kc_file
  file_permission = "0600"
  content         = ssh_resource.retrieve_kubeconfig.result
}

provider "harvester" {
  kubeconfig = local_file.kube_config_yaml.filename
}

provider "kubernetes" {
  config_path = local_file.kube_config_yaml.filename
}

/*
module "harvester_cluster_network" {
  depends_on                      = [local_file.kube_config_yaml]
  source                          = "../../modules/network"
  cluster_network_name            = var.cluster_network_name
  cluster_network_vlanconfig_name = var.cluster_network_vlanconfig_name
  cluster_network_vlan_nics       = var.cluster_network_vlan_nics
  network_name                    = var.network_name
  network_vlan_id                 = var.network_vlan_id
  harvester_namespace             = var.harvester_namespace
}
*/
