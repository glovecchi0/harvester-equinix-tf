resource "harvester_clusternetwork" "vlan" {
  name = var.cluster_network_name
}

data "harvester_clusternetwork" "vlan" {
  depends_on = [harvester_clusternetwork.vlan]
  name       = var.cluster_network_name
}

resource "harvester_vlanconfig" "cluster_vlan_allnodes" {
  depends_on = [data.harvester_clusternetwork.vlan]
  name       = var.cluster_network_vlanconfig_name

  cluster_network_name = data.harvester_clusternetwork.vlan.name

  uplink {
    nics = var.cluster_network_vlan_nics

    bond_mode = "active-backup"
  }
}

resource "harvester_network" "cluster_vlan" {
  depends_on = [harvester_vlanconfig.cluster_vlan_allnodes]
  name       = var.network_name
  namespace  = var.harvester_namespace

  vlan_id = var.network_vlan_id

  route_mode           = "auto"
  route_dhcp_server_ip = ""

  cluster_network_name = data.harvester_clusternetwork.vlan.name
}
