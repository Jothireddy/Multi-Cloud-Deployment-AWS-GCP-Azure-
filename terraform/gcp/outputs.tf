output "cluster_endpoint" {
  description = "GKE Cluster endpoint"
  value       = google_container_cluster.gke_cluster.endpoint
}
