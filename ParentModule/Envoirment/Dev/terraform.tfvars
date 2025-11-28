resource_group = {
  rg1 = {
    name     = "micro-rg-001"
    location = "westus"
  }
}

pip = {
  pip1 = {
    name                = "micro-pip-001"
    location            = "westus"
    allocation_method   = "Static"
    resource_group_name = "micro-rg-001"
  }

  pip2 = {
    name                = "micro-pip-002"
    location            = "westus"
    allocation_method   = "Static"
    resource_group_name = "micro-rg-001"
  }
}

virtual_network = {
  vnet1 = {
    name                = "micro-vnet-001"
    location            = "westus"
    resource_group_name = "micro-rg-001"
    address_space       = ["10.0.0.0/16"]
    subnets = {
      subnet1 = {
        name             = "AzureBastionSubnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet2 = {
        name             = "microsubnet001"
        address_prefixes = ["10.0.10.0/24"]
      }
      subnet3 = {
        name             = "microsubnet002"
        address_prefixes = ["10.0.30.0/24"]
      }
    }

  }
}

acr = {
  acr1 = {
    name                = "microracr001"
    resource_group_name = "micro-rg-001"
    location            = "westus"
    sku                 = "Premium"
    admin_enabled       = false
    georeplicationss = {
      geo1 = {
        location                = "eastus"
        zone_redundancy_enabled = true
        tags                    = {}
      }
    }
  }
}

aks = {
  ask1 = {
    name                = "microask001"
    location            = "north europe"
    resource_group_name = "micro-rg-001"
    dns_prefix          = "exampleaks1"
    default_node_pools = {
      dp1 = {
        name       = "default"
        node_count = 1
        vm_size    = "standard_L2aos_v4"
      }
    }
  }
}

nic = {
  nic1 = {
    name                = "micro-nic-001"
    location            = "westus"
    resource_group_name = "micro-rg-001"
    subnet_name         = "microsubnet002"
    vnet_name           = "micro-vnet-001"
    ip_configurations = {
      ip_cofig1 = {
        name                          = "lbipinternal"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
}

lb = {
  lb1 = {
    name                = "microlb001"
    location            = "westus"
    resource_group_name = "micro-rg-001"
    pip_name            = "micro-pip-001"
    frontend_ip_configurations = {
      front_ip1 = {
        name = "PublicIPAddres"
      }
    }
  }
}

bastion = {
  bastion1 = {
    name                 = "devbastion"
    location             = "westus"
    resource_group_name  = "micro-rg-001"
    virtual_network_name = "micro-vnet-001"
    subnet_name          = "AzureBastionSubnet"
    pip_name             = "micro-pip-002"
    ip_configurations = {
      ip_cofig2 = {
        name = "ipconfigbastion"
      }
    }
  }
}
