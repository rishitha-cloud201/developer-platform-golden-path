resource "azurerm_key_vault" "platform" {
  name                = substr(replace("kv-${var.project_name}-${var.environment}", "-", ""), 0, 24)
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id

  sku_name = "standard"

  enable_rbac_authorization = true
  purge_protection_enabled   = false

  tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
  }
}