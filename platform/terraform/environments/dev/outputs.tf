output "resource_group_name" {
  description = "Name of the Azure resource group"
  value       = azurerm_resource_group.platform.name
}

output "resource_group_location" {
  description = "Azure region of the resource group"
  value       = azurerm_resource_group.platform.location
}
output "vnet_name" {
  description = "Platform virtual network name"
  value       = module.networking.vnet_name
}

output "acr_name" {
  description = "Azure Container Registry name"
  value       = module.acr.acr_name
}

output "acr_login_server" {
  description = "Azure Container Registry login server"
  value       = module.acr.login_server
}

output "aks_name" {
  description = "AKS cluster name"
  value       = module.aks.aks_name
}

output "key_vault_name" {
  description = "Azure Key Vault name"
  value       = module.key_vault.key_vault_name
}

output "key_vault_uri" {
  description = "Azure Key Vault URI"
  value       = module.key_vault.key_vault_uri
}