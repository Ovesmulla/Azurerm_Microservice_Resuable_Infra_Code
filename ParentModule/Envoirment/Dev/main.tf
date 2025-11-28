module "resource_group" {
  source         = "../../../ChildModule/Azurerm_resource_group"
  resource_group = var.resource_group
}

module "pip" {
  depends_on = [module.resource_group]
  source     = "../../../ChildModule/Azurerm_public_ip"
  pip        = var.pip
}

module "virtual_network" {
  depends_on      = [module.resource_group]
  source          = "../../../ChildModule/Azurerm_virtual_network"
  virtual_network = var.virtual_network
}

module "acr" {
  depends_on = [module.resource_group]
  source     = "../../../ChildModule/Azurerm_acr"
  acr        = var.acr
}

module "aks" {
  depends_on = [module.resource_group]
  source     = "../../../ChildModule/Azurerm_aks"
  aks        = var.aks
}

module "nic" {
  depends_on = [module.virtual_network]
  source     = "../../../ChildModule/Azurerm_network_interface_card"
  nic        = var.nic
}

module "lb" {
  depends_on = [module.pip]
  source     = "../../../ChildModule/Azurerm_load_balance"
  lb         = var.lb
}

module "baston" {
  depends_on = [module.resource_group, module.virtual_network, module.pip]
  source     = "../../../ChildModule/Azurerm_bastion"
  bastion    = var.bastion
}

module "mysqlserver" {
  depends_on = [module.resource_group]
  source     = "../../../ChildModule/Azure_mysql_server"
  servers    = var.servers
}

module "mysql_database" {
  depends_on = [module.mysqlserver]
  source     = "../../../ChildModule/Azure_mysql_database"
  database   = var.database
}
