prometheus = {
  second_interval = "15s"
  port            = 9090
  node_exporter   = {
    port = 9100
  }
}

docker = {
  router = {
    cpu    = "0.5"
    memory = "512M"
  }
  prometheus = {
    cpu    = "0.5"
    memory = "512M"
  }
}