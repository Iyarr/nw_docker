resource "local_file" "router_dockerfile" {
  content  = file("./router/dockerfile")
  filename = "local/router/dockerfile"
}

resource "docker_image" "router" {
  name = "nw_docker_rip_v1_router:latest"
  build {
    context = "local/router/"
  }
  triggers = {
    sha256 = local_file.router_dockerfile.content_sha256
  }
}

resource "docker_container" "router0" {
  name  = "router0"
  image = docker_image.router.image_id
  memory = 512
  networks_advanced {
    name = docker_network.inet0.name
  }
  networks_advanced {
    name = docker_network.inet1.name
  }
}

resource "docker_container" "router1" {
  name  = "router1"
  image = docker_image.router.image_id
  memory = 512
  networks_advanced {
    name = docker_network.inet0.name
  }
  networks_advanced {
    name = docker_network.inet2.name
  }
}

resource "docker_container" "router2" {
  memory = 512
  name  = "router2"
  image = docker_image.router.image_id
  networks_advanced {
    name = docker_network.inet1.name
  }
  networks_advanced {
    name = docker_network.inet2.name
  }
}