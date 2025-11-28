variable "pip" {
  type = map(object({
    name                = string
    location            = string
    allocation_method   = string
    resource_group_name = string
  }))
}
