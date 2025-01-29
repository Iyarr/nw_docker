locals {
  network_datas = concat(
    docker_container.router0.network_data,
    docker_container.router1.network_data,
    docker_container.router2.network_data,
  )
  prometheus_network_addr_list = [
    for network_data in local.network_datas : network_data if network_data.network_name == "prometheus"
  ]
  prometheus_targets_addr = [
    for network_data in local.prometheus_network_addr_list : "\"${network_data.ip_address}:${var.prometheus.node_exporter.port}\""
  ]
}

resource "local_file" "prometheus" {
  content = templatefile("./temp/prometheus", {
    second_interval         = var.prometheus.second_interval,
    prometheus_targets_addr = "[${join(",", local.prometheus_targets_addr)}]",
  })

  filename = "local/prometheus.yml"
}

resource "docker_image" "prometheus" {
  name = "ubuntu/prometheus:2.53.3-24.04_stable"
}

resource "docker_container" "prometheus" {
  name  = "prometheus"
  image = docker_image.prometheus.image_id
  networks_advanced {
    name = docker_network.prometheus.name
  }
  ports {
    internal = var.prometheus.port
    external = var.prometheus.port
  }
  upload {
    source = local_file.prometheus.filename
    file   = "/etc/prometheus/prometheus.yml"
  }
}