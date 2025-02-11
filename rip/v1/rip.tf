resource "local_file" "router0_frr_conf" {
  content  = <<EOF
  configure terminal
  router rip
  version 1
  network ${docker_container.router0.network_data.0.ip_address}/28
  network ${docker_container.router0.network_data.1.ip_address}/28
  EOF
  filename = "local/router0/frr.conf"
}

resource "local_file" "router1_frr_conf" {
  content  = <<EOF
  configure terminal
  router rip
  version 1
  network ${docker_container.router1.network_data.0.ip_address}/28
  network ${docker_container.router1.network_data.1.ip_address}/28
  EOF
  filename = "local/router1/frr.conf"
}

resource "local_file" "router2_frr_conf" {
  content  = <<EOF
  configure terminal
  router rip
  version 1
  network ${docker_container.router2.network_data.0.ip_address}/28
  network ${docker_container.router2.network_data.1.ip_address}/28
  EOF
  filename = "local/router2/frr.conf"
}

