# Multi-Cloud Deployment with Kubernetes & Terraform

This project demonstrates how to deploy a multi-cloud, multi-region Kubernetes environment across AWS, GCP, and Azure using Terraform. Each cloud provider hosts a managed Kubernetes cluster:

- **AWS EKS:** Managed Kubernetes on AWS.
- **GCP GKE:** Managed Kubernetes on Google Cloud.
- **Azure AKS:** Managed Kubernetes on Microsoft Azure.

A sample application (defined in the `/k8s` folder) can be deployed on each cluster, allowing you to run the same workload in a multi-cloud setup.

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Setup & Deployment](#setup--deployment)
- [Post-Deployment: Deploying a Sample App](#post-deployment-deploying-a-sample-app)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Overview

This project uses Terraform to provision:
- An EKS cluster in AWS.
- A GKE cluster in GCP.
- An AKS cluster in Azure.

Once provisioned, you can switch your `kubectl` context between clouds and deploy your applications. This approach is ideal for:
- High availability and disaster recovery.
- Workload portability.
- Avoiding vendor lock-in.

## Architecture

- **Terraform Root Module:**  
  Instantiates three submodules—one for each cloud provider.
  
- **AWS Module:**  
  Provisions an EKS cluster with basic settings.

- **GCP Module:**  
  Provisions a GKE cluster in a specified project and region.

- **Azure Module:**  
  Provisions an AKS cluster in a designated resource group and region.

- **Kubernetes Manifests:**  
  Located in the `/k8s` folder, they contain a sample application Deployment and Service that you can apply to any of the clusters.

## Project Structure

multi-cloud-deployment/ ├── README.md ├── k8s/ │ ├── sample-app.yaml │ └── ingress.yaml └── terraform/ ├── main.tf ├── variables.tf ├── outputs.tf ├── aws/ │ ├── provider.tf │ ├── eks.tf │ ├── variables.tf │ └── outputs.tf ├── gcp/ │ ├── provider.tf │ ├── gke.tf │ ├── variables.tf │ └── outputs.tf └── azure/ ├── provider.tf ├── aks.tf ├── variables.tf └── outputs.tf



## Prerequisites

- **Terraform:** v1.0+ installed.
- **AWS CLI:** Configured with appropriate credentials.
- **gcloud CLI:** Installed and configured for your GCP project.
- **Azure CLI:** Installed and logged in.
- **kubectl:** Installed.
- **Git:** Installed for cloning this repository.
- **Cloud Provider Credentials:** Make sure you have permissions to create Kubernetes clusters on AWS, GCP, and Azure.

## Setup & Deployment

1. **Clone the Repository:**

 ```bash
   git clone <repository_url>
  ```
## Configure Root Variables:

Edit terraform/variables.tf to set your cloud regions, cluster names, and other parameters. (Each module also has its own variables file.)

Deploy the Infrastructure:

In the root terraform/ directory, run:

```
terraform init
terraform plan -out=tfplan
terraform apply -auto-approve tfplan
```
This will provision clusters in AWS, GCP, and Azure. Review the outputs for each cluster (e.g., cluster endpoint details).

Post-Deployment: Deploying a Sample App
After your clusters are provisioned:

Switch Context:
Use the cloud provider’s CLI or Terraform outputs to configure your kubectl context for the desired cluster.

For example, for AWS EKS:

```
aws eks --region <aws_region> update-kubeconfig --name <aws_cluster_name>
```
For GCP GKE:

```
gcloud container clusters get-credentials <gke_cluster_name> --region <gcp_region> --project <gcp_project>
```
For Azure AKS:

```
az aks get-credentials --resource-group <resource_group_name> --name <aks_cluster_name>
```
Deploy the Sample Application:

In the /k8s directory, deploy the sample app:

```
kubectl apply -f k8s/sample-app.yaml
```
This will create a simple deployment and service. Verify by running:

```
kubectl get pods,svc
```
## Troubleshooting
Terraform Errors:
Check that your cloud provider credentials are correctly configured and that required APIs are enabled (e.g., Kubernetes Engine API in GCP).

## Cluster Provisioning Issues:
Review the Terraform output logs. Each module’s logs can help diagnose issues in that specific cloud.

## kubectl Context Issues:
Ensure that you have switched the context to the intended cluster before deploying the sample app.

## Contributing
Contributions are welcome! Please fork the repository, create feature branches, and open pull requests with your improvements.

## License
This project is licensed under the MIT License. See the LICENSE file for details.


