variable "prometheus" {
  type = object({
    second_interval = number
    port            = number
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