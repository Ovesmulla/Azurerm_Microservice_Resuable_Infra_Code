variable "nic" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_name         = string
    vnet_name           = string
    ip_configurations = map(object({
      name                          = string
      private_ip_address_allocation = string
    }))
  }))

}