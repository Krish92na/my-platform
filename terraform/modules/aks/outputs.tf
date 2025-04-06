output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.raw_kube_config
  sensitive = true
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
  sensitive = true
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}
