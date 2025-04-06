resource "azurerm_postgresql_flexible_server" "db" {
  name                   = var.db_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = "15"
  administrator_login    = var.admin_user
  administrator_password = var.admin_password
  zone                   = "1"
  storage_mb             = 32768
  sku_name               = "B1ms"

  backup_retention_days = 7
  geo_redundant_backup_enabled = false
  delegated_subnet_id = var.subnet_id

  authentication {
    active_directory_auth_enabled = false
    password_auth_enabled         = true
  }
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_azure" {
  name             = "AllowAzure"
  server_name      = azurerm_postgresql_flexible_server.db.name
  resource_group_name = var.resource_group_name
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
