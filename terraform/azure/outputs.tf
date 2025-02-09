output "cluster_endpoint" {
  description = "AKS Cluster endpoint (FQDN)"
  value       = azurerm_kubernetes_cluster.aks_cluster.fqdn
}
