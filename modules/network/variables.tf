variable "cluster_network_name" {
  description = "Harvester's Cluster Network name"
  type        = string
  default     = "cluster-vlan"
}

variable "cluster_network_vlanconfig_name" {
  description = "Harvester's Cluster Network VLAN config name"
  type        = string
  default     = "cluster-vlan-all-nodes"
}

variable "cluster_network_vlan_nics" {
  description = "Harvester's Cluster Network VLAN NICs"
  type        = list(any)
  default     = ["enp1s0f1"]
}

variable "network_name" {
  description = "Harvester's VMs Network name"
  type        = string
  default     = "vlan1"
}

variable "network_vlan_id" {
  description = "Harvester's VMs Network VLAN ID"
  type        = number
  default     = 1
}

variable "harvester_namespace" {
  description = "Harvester's Namespace"
  type        = string
  default     = "default"
}
