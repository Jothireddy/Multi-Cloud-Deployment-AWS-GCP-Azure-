output "aws_cluster_endpoint" {
  description = "Endpoint for AWS EKS cluster"
  value       = module.aws.cluster_endpoint
}

output "gcp_cluster_endpoint" {
  description = "Endpoint for GCP GKE cluster"
  value       = module.gcp.cluster_endpoint
}

output "azure_cluster_endpoint" {
  description = "Endpoint for Azure AKS cluster"
  value       = module.azure.cluster_endpoint
}
