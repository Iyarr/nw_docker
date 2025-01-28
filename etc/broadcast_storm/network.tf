resource "docker_network" "inet0_1" {
  name = "inet0_1"
  ipam_config {
    subnet = "192.168.10.16/28"
  }
}

resource "docker_network" "inet0_2" {
  name = "inet0_2"
  ipam_config {
    subnet = "192.168.10.32/28"
  }
}

resource "docker_network" "inet1_2" {
  name = "inet1_2"
  ipam_config {
    subnet = "192.168.10.48/28"
  }
}

resource "docker_network" "prometheus" {
  name = "prometheus"
  ipam_config {
    subnet = "192.168.10.64/28"
  }
}