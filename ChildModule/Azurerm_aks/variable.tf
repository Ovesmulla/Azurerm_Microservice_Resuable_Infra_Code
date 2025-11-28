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
