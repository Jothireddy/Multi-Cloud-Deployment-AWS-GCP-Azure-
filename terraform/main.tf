
```hcl
module "aws" {
  source       = "./aws"
  region       = var.aws_region
  cluster_name = var.aws_cluster_name
}

module "gcp" {
  source       = "./gcp"
  region       = var.gcp_region
  cluster_name = var.gcp_cluster_name
  project      = var.gcp_project
}

module "azure" {
  source                = "./azure"
  region                = var.azure_region
  cluster_name          = var.azure_cluster_name
  resource_group_name   = var.azure_resource_group_name
}
