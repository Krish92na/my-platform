resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = "system"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  azure_active_directory_role_based_access_control {
    managed                = true
    tenant_id              = var.tenant_id
    admin_group_object_ids = [var.admin_group_object_id]
  }

  network_profile {
    network_plugin = "azure"
  }

  tags = {
    environment = var.environment
  }
}

