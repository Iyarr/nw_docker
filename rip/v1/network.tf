resource "docker_network" "inet0" {
  name = "rip_v1_inet0"
  ipam_config {
    subnet = "192.168.100.0/24"
  }
}

resource "docker_network" "inet1" {
  name = "rip_v1_inet1"
  ipam_config {
    subnet = "192.168.101.0/24"
  }
}

resource "docker_network" "inet2" {
  name = "rip_v1_inet2"
  ipam_config {
    subnet = "192.168.102.0/24"
  }
}
