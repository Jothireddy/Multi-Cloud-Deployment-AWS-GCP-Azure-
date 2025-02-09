resource "google_container_cluster" "gke_cluster" {
  name     = var.cluster_name
  location = var.region

  initial_node_count = 1

  remove_default_node_pool = true

  # Create a node pool
  node_pool {
    name       = "default-pool"
    node_count = 1

    node_config {
      machine_type = "e2-medium"
    }
  }
}

output "cluster_endpoint" {
  value = google_container_cluster.gke_cluster.endpoint
}
