################################################################################
# This file is used to define outputs for your Terraform EKS module. modules/eks/outputs.tf  ( this output It doesn't show in console purpos , is used for assign value in modules)
################################################################################

output "eks_cluster_name" {
  description = "Name of the created EKS cluster"
  value       = aws_eks_cluster.my_eks_cluster.name
}

output "eks_node_group_name" {
  description = "Name of the EKS node group"
  value       = aws_eks_node_group.node-grp.node_group_name
}


