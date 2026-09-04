output "key_vault_id" {
  description = "Azure Key Vault ID"
  value       = azurerm_key_vault.platform.id
}

output "key_vault_name" {
  description = "Azure Key Vault name"
  value       = azurerm_key_vault.platform.name
}

output "key_vault_uri" {
  description = "Azure Key Vault URI"
  value       = azurerm_key_vault.platform.vault_uri
}