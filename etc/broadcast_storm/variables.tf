variable "prometheus" {
  type = object({
    second_interval = string
    port            = number
    node_exporter   = object({
      port = number
    })
  })
}

variable "docker" {
  type = object({
    router = object({
      cpu    = string
      memory = string
    })
    prometheus = object({
      cpu    = string
      memory = string
    })
  })
}