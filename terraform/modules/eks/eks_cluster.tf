resource "aws_eks_cluster" "my_eks_cluster" {
  name =  var.cluster_name
  # aasign master role to eks cluster
  role_arn = aws_iam_role.master.arn

  vpc_config {
     subnet_ids = [var.subnet_public1_id,var.subnet_public2_id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
  ]

}