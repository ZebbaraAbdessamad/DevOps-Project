################################################################################
# This file is used to define output values that you want to expose after creating the EKS cluster.
################################################################################

output "region" {
  value = var.aws_region
}

output "eks_cluster_name" {
  description = "Name of the created EKS cluster"
  value       = module.eks.eks_cluster_name
}

output "eks_node_group_name" {
  description = "Name of the EKS node group"
  value       = module.eks.eks_node_group_name
}

output "subnet_public1_id" {
  description = "the id of public subnet 1"
  value = module.vpc.subnet_public1_id
}

output "subnet_public2_id" {
  description = "the id of public subnet 2"
  value = module.vpc.subnet_public2_id
}

output "vpc_id" {
  description = "the id of vpc network"
  value = module.vpc.vpc_id
}