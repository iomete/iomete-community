module "data-plane-aws" {
  source                    = "iomete/data-plane-aws/aws"
  version                   = "~> 2.1.1"
  region                    = "us-east-1"
  cluster_name              = "dataplane-name"
  lakehouse_bucket_name     = "iomete-lakehouse-name"
}

output "cluster_name" {
  description = "Kubernetes cluster name"
  value       = module.data-plane-aws.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint for your Kubernetes API server"
  value       = module.data-plane-aws.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate cluster with the IOMETE controlplane"
  value       = module.data-plane-aws.cluster_certificate_authority_data
}
