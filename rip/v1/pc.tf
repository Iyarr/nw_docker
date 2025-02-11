resource "local_file" "pc_dockerfile" {
  content  = file("./pc/dockerfile")
  filename = "local/pc/dockerfile"
}

resource "docker_image" "pc" {
  name = "nw_docker_rip_v1_router:latest"
  build {
    context = "local/pc/"
  }
  triggers = {
    sha256 = local_file.pc_dockerfile.content_sha256
  }
}

resource "docker_container" "pc0" {
  name  = "pc0"
  image = docker_image.pc.image_id
  memory = 128
  networks_advanced {
    name         = docker_network.inet0.name
  }
}

resource "docker_container" "pc1" {
  name  = "pc1"
  image = docker_image.pc.image_id
  memory = 128
  networks_advanced {
    name         = docker_network.inet2.name
  }
}