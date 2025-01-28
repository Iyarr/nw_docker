prometheus = {
  second_interval = 10
  port            = 9090
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