resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = "arn:aws:iam::123456789012:role/eks-cluster-role"  # Replace with a valid IAM role ARN

  vpc_config {
    subnet_ids = ["subnet-0123456789abcdef0", "subnet-0fedcba9876543210"]  # Replace with your subnet IDs
  }
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}
