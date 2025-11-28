variable "lb" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    pip_name            = string
    frontend_ip_configurations = map(object({
      name = string
    }))
  }))
}