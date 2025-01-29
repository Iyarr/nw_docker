resource "docker_image" "grafana" {
  name = "grafana/grafana:latest"
}

resource "local_file" "grafana_datasource" {
  content = templatefile("./temp/grafana/datasource", {
    prometheus_url = "http://${docker_container.prometheus.network_data[0].ip_address}:${var.prometheus.port}",
  })

  filename = "local/grafana/datasource.yml"
}

resource "docker_container" "grafana" {
  name  = "grafana"
  image = docker_image.grafana.image_id
  networks_advanced {
    name = docker_network.prometheus.name
  }
  upload {
    source = local_file.grafana_datasource.filename
    file   = "/etc/grafana/provisioning/datasources/datasource.yml"
  }
  ports {
    internal = 3000
    external = 3000
  }
}