output "vnet_id" {
  description = "Virtual network ID"
  value       = azurerm_virtual_network.platform.id
}

output "vnet_name" {
  description = "Virtual network name"
  value       = azurerm_virtual_network.platform.name
}

output "aks_subnet_id" {
  description = "AKS subnet ID"
  value       = azurerm_subnet.aks.id
}