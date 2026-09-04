data "azurerm_client_config" "current" {}
resource "azurerm_resource_group" "platform" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.location

  tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
  }
}
module "networking" {
  source = "../../modules/networking"

  resource_group_name = azurerm_resource_group.platform.name
  location            = azurerm_resource_group.platform.location
  environment         = var.environment
  project_name        = var.project_name
}
module "acr" {
  source = "../../modules/acr"

  resource_group_name = azurerm_resource_group.platform.name
  location            = azurerm_resource_group.platform.location
  environment         = var.environment
  project_name        = var.project_name
}
module "aks" {
  source = "../../modules/aks"

  resource_group_name = azurerm_resource_group.platform.name
  location            = azurerm_resource_group.platform.location
  environment         = var.environment
  project_name        = var.project_name

  subnet_id = module.networking.aks_subnet_id
  acr_id    = module.acr.acr_id
}
module "key_vault" {
  source = "../../modules/key-vault"

  resource_group_name = azurerm_resource_group.platform.name
  location            = azurerm_resource_group.platform.location
  environment         = var.environment
  project_name        = var.project_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
}