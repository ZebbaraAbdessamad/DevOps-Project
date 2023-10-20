################################################################################
# This file is used to define input variables for your Terraform EKS module. modules/eks/variables.tf
################################################################################

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "capacity_type" {
  description = "Capacity type for the EKS nodes (e.g., ON_DEMAND or SPOT)"
  type        = string
}

variable "instance_type" {
  description = "Instance types for the EKS nodes"
  type        = string
}

variable "ec2_ssh_key" {
  description = "SSH key name for the EKS nodes"
  type        = string
}

variable "vpc_id" {}

variable "scaling_desired_size" {}

variable "scaling_max_size" {}

variable "scaling_min_size" {}

variable "subnet_public1_id" {}

variable "subnet_public2_id" {}
