resource "aws_eks_node_group" "node-grp" {
  cluster_name    = aws_eks_cluster.my_eks_cluster.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.worker.arn
  subnet_ids = [var.subnet_public1_id,var.subnet_public2_id]
  capacity_type = var.capacity_type
  # disk_size       = "20"
  instance_types  = [var.instance_type]


  remote_access {
    ec2_ssh_key               = var.ec2_ssh_key
    source_security_group_ids = [aws_security_group.my_security_group.id]

  }

  # tomap({ env = "dev" }): This part of the code is creating a map (dictionary) in Terraform where "env"
  # is the key, and "dev" is the value. It is using the tomap function to convert the key-value pair into a map.

  labels = tomap({ env = "dev" })

  scaling_config {
    desired_size = var.scaling_desired_size 
    max_size     = var.scaling_max_size 
    min_size     = var.scaling_min_size 
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}