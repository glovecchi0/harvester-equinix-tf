## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_harvester"></a> [harvester](#requirement\_harvester) | 0.6.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_harvester"></a> [harvester](#provider\_harvester) | 0.6.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [harvester_clusternetwork.vlan](https://registry.terraform.io/providers/harvester/harvester/0.6.4/docs/resources/clusternetwork) | resource |
| [harvester_network.cluster_vlan](https://registry.terraform.io/providers/harvester/harvester/0.6.4/docs/resources/network) | resource |
| [harvester_vlanconfig.cluster_vlan_allnodes](https://registry.terraform.io/providers/harvester/harvester/0.6.4/docs/resources/vlanconfig) | resource |
| [harvester_clusternetwork.vlan](https://registry.terraform.io/providers/harvester/harvester/0.6.4/docs/data-sources/clusternetwork) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_network_name"></a> [cluster\_network\_name](#input\_cluster\_network\_name) | Harvester's Cluster Network name | `string` | `"cluster-vlan"` | no |
| <a name="input_cluster_network_vlan_nics"></a> [cluster\_network\_vlan\_nics](#input\_cluster\_network\_vlan\_nics) | Harvester's Cluster Network VLAN NICs | `list(any)` | <pre>[<br>  "enp1s0f1"<br>]</pre> | no |
| <a name="input_cluster_network_vlanconfig_name"></a> [cluster\_network\_vlanconfig\_name](#input\_cluster\_network\_vlanconfig\_name) | Harvester's Cluster Network VLAN config name | `string` | `"cluster-vlan-all-nodes"` | no |
| <a name="input_harvester_namespace"></a> [harvester\_namespace](#input\_harvester\_namespace) | Harvester's Namespace | `string` | `"default"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Harvester's VMs Network name | `string` | `"vlan1"` | no |
| <a name="input_network_vlan_id"></a> [network\_vlan\_id](#input\_network\_vlan\_id) | Harvester's VMs Network VLAN ID | `number` | `1` | no |

## Outputs

No outputs.
