provider "azurerm" {
  features {}
}

module "aks" {
  source                = "../../modules/aks"
  cluster_name          = "dev-aks"
  location              = "westeurope"
  resource_group_name   = "rg-dev-aks"
  dns_prefix            = "devaks"
  tenant_id             = var.tenant_id
  admin_group_object_id = var.admin_group_object_id
  environment           = "dev"
}
