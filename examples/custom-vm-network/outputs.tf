output "harvester_url" {
  value = module.harvester_equinix.harvester_url
}

output "longhorn_url" {
  value = "${module.harvester_equinix.harvester_url}dashboard/c/local/longhorn"
}

output "equinix_first_server_public_ip" {
  value = module.harvester_equinix.seed_ip
}

output "equinix_additional_servers_public_ip" {
  value = module.harvester_equinix.join_ips
}
