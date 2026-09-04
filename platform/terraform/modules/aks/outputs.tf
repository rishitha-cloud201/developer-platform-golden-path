output "aks_id" {
  description = "AKS cluster ID"
  value       = azurerm_kubernetes_cluster.platform.id
}

output "aks_name" {
  description = "AKS cluster name"
  value       = azurerm_kubernetes_cluster.platform.name
}

output "kubelet_identity_object_id" {
  description = "AKS kubelet managed identity object ID"
  value       = azurerm_kubernetes_cluster.platform.kubelet_identity[0].object_id
}