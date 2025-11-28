
variable "resource_group" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "pip" {
  type = map(object({
    name                = string
    location            = string
    allocation_method   = string
    resource_group_name = string
  }))
}

variable "virtual_network" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnets = map(object({
      name = string
      address_prefixes = list(string) })
    )
  }))
}

variable "acr" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
    admin_enabled       = bool
    georeplicationss = map(object({
      location                = string
      zone_redundancy_enabled = bool
      tags                    = map(string)
    }))
  }))
}

variable "aks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
    default_node_pools = map(object({
      name       = string
      node_count = number
      vm_size    = string
    }))
  }))
}

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

variable "bastion" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    virtual_network_name = string
    subnet_name          = string
    pip_name             = string
    ip_configurations = map(object({
      name = string
    }))
  }))
}
