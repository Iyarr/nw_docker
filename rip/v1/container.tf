resource "docker_image" "router" {
  name = "router:latest"
  build {
    context = "."
  }
}

resource "docker_container" "ubuntu" {
  name  = "foo"
  image = docker_image.router.image_id
  command = ["tail","-f","/dev/null"]
  sysctls = {
    "net.ipv4.ip_forward" = "1"
  }
}