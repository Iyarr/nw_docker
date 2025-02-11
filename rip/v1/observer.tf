
resource "docker_image" "prometheus" {
  name = "ubuntu/prometheus:2.53.3-24.04_stable"
}

resource "docker_container" "prometheus" {
  name  = "prometheus"
  image = docker_image.prometheus.image_id
  memory = 512
  networks_advanced {
    name = docker_network.inet0.name
  }
  networks_advanced {
    name = docker_network.inet1.name
  }
  networks_advanced {
    name = docker_network.inet2.name
  }
}