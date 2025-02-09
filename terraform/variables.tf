variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "aws_cluster_name" {
  description = "Name of the AWS EKS cluster"
  type        = string
  default     = "multi-cloud-eks"
}

variable "gcp_region" {
  description = "GCP region for deployment"
  type        = string
  default     = "us-central1"
}

variable "gcp_cluster_name" {
  description = "Name of the GCP GKE cluster"
  type        = string
  default     = "multi-cloud-gke"
}

variable "gcp_project" {
  description = "GCP Project ID"
  type        = string
  default     = "your-gcp-project-id"
}

variable "azure_region" {
  description = "Azure region for deployment"
  type        = string
  default     = "eastus"
}

variable "azure_cluster_name" {
  description = "Name of the Azure AKS cluster"
  type        = string
  default     = "multi-cloud-aks"
}

variable "azure_resource_group_name" {
  description = "Resource group name for Azure AKS"
  type        = string
  default     = "multi-cloud-rg"
}
