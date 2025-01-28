resource "local_file" "dockerfile" {
  content  = templatefile("./temp/dockerfile", {})
  filename = "local/Dockerfile"
}

resource "docker_image" "router" {
  name = "router:latest"
  build {
    context = "local/"
  }
  triggers = {
    sha256 = local_file.dockerfile.content_sha256
  }

  depends_on = [local_file.dockerfile]
}

resource "docker_container" "router0" {
  name  = "router0"
  image = docker_image.router.image_id
  sysctls = {
    "net.ipv4.ip_forward" = "1"
  }
  networks_advanced {
    name = docker_network.inet0_1.name
  }
  networks_advanced {
    name = docker_network.inet0_2.name
  }
  networks_advanced {
    name = docker_network.prometheus.name
  }
}

resource "docker_container" "router1" {
  name  = "router1"
  image = docker_image.router.image_id
  sysctls = {
    "net.ipv4.ip_forward" = "1"
  }
  networks_advanced {
    name = docker_network.inet0_1.name
  }
  networks_advanced {
    name = docker_network.inet1_2.name
  }
  networks_advanced {
    name = docker_network.prometheus.name
  }
}

resource "docker_container" "router2" {
  name  = "router2"
  image = docker_image.router.image_id
  sysctls = {
    "net.ipv4.ip_forward" = "1"
  }
  networks_advanced {
    name = docker_network.inet0_2.name
  }
  networks_advanced {
    name = docker_network.inet1_2.name
  }
  networks_advanced {
    name = docker_network.prometheus.name
  }
}