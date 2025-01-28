output "router0_nw" {
  value = docker_container.router0.network_data
}

output "router1_nw" {
  value = docker_container.router1.network_data
}

output "router2_nw" {
  value = docker_container.router2.network_data
}

output "prometheus_nw" {
  value = docker_container.prometheus.network_data
}

output "prometheus_network_addr_list" {
  value = local.prometheus_network_addr_list
}

output "prometheus_targets_addr" {
  value = local.prometheus_targets_addr
}