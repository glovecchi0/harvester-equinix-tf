## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_equinix"></a> [equinix](#requirement\_equinix) | 2.4.1 |
| <a name="requirement_harvester"></a> [harvester](#requirement\_harvester) | 0.6.4 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.10.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0.0 |
| <a name="requirement_rancher2"></a> [rancher2](#requirement\_rancher2) | 5.0.0 |
| <a name="requirement_ssh"></a> [ssh](#requirement\_ssh) | 2.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_ssh"></a> [ssh](#provider\_ssh) | 2.7.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_harvester_equinix"></a> [harvester\_equinix](#module\_harvester\_equinix) | ../../modules/infrastructure | n/a |

## Resources

| Name | Type |
|------|------|
| [local_file.kube_config_yaml](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.wait_harvester_services_startup](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [ssh_resource.retrieve_kubeconfig](https://registry.terraform.io/providers/loafoe/ssh/2.7.0/docs/resources/resource) | resource |
| [local_file.ssh_private_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | Equinix Metal authentication token. Required when using Spot Instances for HTTP pricing lookups. METAL\_AUTH\_TOKEN should always be set as an environment variable | `string` | `""` | no |
| <a name="input_billing_cycle"></a> [billing\_cycle](#input\_billing\_cycle) | Equinix metal billing/invoice generation schedule (hourly/daily/monthly/yearly) | `string` | `"hourly"` | no |
| <a name="input_cluster_network_name"></a> [cluster\_network\_name](#input\_cluster\_network\_name) | Name of the Harvester Cluster Network | `string` | `"cluster-vlan"` | no |
| <a name="input_cluster_network_vlan_nics"></a> [cluster\_network\_vlan\_nics](#input\_cluster\_network\_vlan\_nics) | List of NICs used for the Harvester Cluster Network VLAN | `list(any)` | <pre>[<br>  "enp1s0f1"<br>]</pre> | no |
| <a name="input_cluster_network_vlanconfig_name"></a> [cluster\_network\_vlanconfig\_name](#input\_cluster\_network\_vlanconfig\_name) | Name of the Harvester Cluster Network VLAN configuration | `string` | `"cluster-vlan-all-nodes"` | no |
| <a name="input_create_ssh_key_pair"></a> [create\_ssh\_key\_pair](#input\_create\_ssh\_key\_pair) | Specify if a new SSH key pair needs to be created for the instances | `bool` | `true` | no |
| <a name="input_harvester_namespace"></a> [harvester\_namespace](#input\_harvester\_namespace) | Namespace where Harvester resources are deployed | `string` | `"default"` | no |
| <a name="input_harvester_version"></a> [harvester\_version](#input\_harvester\_version) | Harvester version to be installed (Must be a valid version tag from https://github.com/rancherlabs/terraform-harvester-equinix/tree/main/ipxe) | `string` | `"v1.3.1"` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of nodes to deploy Harvester cluster | `number` | `3` | no |
| <a name="input_ipxe_script"></a> [ipxe\_script](#input\_ipxe\_script) | URL to the iPXE script to use for booting the server (harvester\_version will be appended to this without the 'v' prefix) | `string` | `"https://raw.githubusercontent.com/rancherlabs/terraform-harvester-equinix/main/ipxe/ipxe-"` | no |
| <a name="input_kube_config_filename"></a> [kube\_config\_filename](#input\_kube\_config\_filename) | Harvester's RKE2 cluster kubeconfig file name | `string` | `null` | no |
| <a name="input_kube_config_path"></a> [kube\_config\_path](#input\_kube\_config\_path) | Harvester's RKE2 cluster kubeconfig file path | `string` | `null` | no |
| <a name="input_max_bid_price"></a> [max\_bid\_price](#input\_max\_bid\_price) | Maximum bid price for spot request | `string` | `"0.75"` | no |
| <a name="input_metal_create_project"></a> [metal\_create\_project](#input\_metal\_create\_project) | Create a Metal Project if this is 'true'. Else use provided 'project\_name' | `bool` | `false` | no |
| <a name="input_metro"></a> [metro](#input\_metro) | Equinix metal data center location (https://deploy.equinix.com/developers/docs/metal/locations/metros/). Examples: SG,SV,AM,MA,Ny,LA,etc. | `string` | `"SG"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the Harvester VMs Network | `string` | `"vlan1"` | no |
| <a name="input_network_vlan_id"></a> [network\_vlan\_id](#input\_network\_vlan\_id) | VLAN ID for the Harvester VMs Network | `number` | `1` | no |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | Equinix Metal organization ID to create or find a project in | `string` | `""` | no |
| <a name="input_plan"></a> [plan](#input\_plan) | Size of the servers to be deployed on Equinix metal (https://deploy.equinix.com/developers/docs/metal/hardware/standard-servers/) | `string` | `"m3.small.x86"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix used in front of all Equinix resources | `string` | `"equinix-tf"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Equinix Metal project ID to deploy into, if not creating a new project or looking up by name | `string` | `""` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the Equinix Metal project to deploy into, when not looking up by project\_id | `string` | `"Harvester Labs"` | no |
| <a name="input_rancher_access_key"></a> [rancher\_access\_key](#input\_rancher\_access\_key) | Rancher access key | `string` | `""` | no |
| <a name="input_rancher_api_url"></a> [rancher\_api\_url](#input\_rancher\_api\_url) | Rancher API endpoint to manager your Harvester cluster | `string` | `""` | no |
| <a name="input_rancher_insecure"></a> [rancher\_insecure](#input\_rancher\_insecure) | Allow insecure connections to the Rancher API | `bool` | `false` | no |
| <a name="input_rancher_secret_key"></a> [rancher\_secret\_key](#input\_rancher\_secret\_key) | Rancher secret key | `string` | `""` | no |
| <a name="input_rke2_config"></a> [rke2\_config](#input\_rke2\_config) | Additional customization to the RKE2 config.yaml file | `string` | `null` | no |
| <a name="input_rke2_version"></a> [rke2\_version](#input\_rke2\_version) | RKE2 version | `string` | `null` | no |
| <a name="input_spot_instance"></a> [spot\_instance](#input\_spot\_instance) | Set to true to use spot instance instead of on demand. Also set your max bid price if true. | `bool` | `true` | no |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | Your ssh key, examples: 'github: myghid' or 'ssh-rsa AAAAblahblah== keyname' | `string` | `""` | no |
| <a name="input_ssh_private_key_path"></a> [ssh\_private\_key\_path](#input\_ssh\_private\_key\_path) | The full path where is present the pre-generated SSH PRIVATE key (not generated by Terraform) | `string` | `null` | no |
| <a name="input_ssh_public_key_path"></a> [ssh\_public\_key\_path](#input\_ssh\_public\_key\_path) | The full path where is present the pre-generated SSH PUBLIC key (not generated by Terraform) | `string` | `null` | no |
| <a name="input_use_cheapest_metro"></a> [use\_cheapest\_metro](#input\_use\_cheapest\_metro) | A boolean variable to control cheapest metro selection | `bool` | `false` | no |
| <a name="input_vlan_count"></a> [vlan\_count](#input\_vlan\_count) | Number of VLANs to be created | `number` | `2` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_equinix_additional_servers_public_ip"></a> [equinix\_additional\_servers\_public\_ip](#output\_equinix\_additional\_servers\_public\_ip) | n/a |
| <a name="output_equinix_first_server_public_ip"></a> [equinix\_first\_server\_public\_ip](#output\_equinix\_first\_server\_public\_ip) | n/a |
| <a name="output_harvester_url"></a> [harvester\_url](#output\_harvester\_url) | n/a |
