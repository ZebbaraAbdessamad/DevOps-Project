################################################################################
# This file is used to define outputs for your Terraform VPC module.  modules/vpc/outputs.tf  ( this output It doesn't show in console purpos , is used for assign value in modules)
################################################################################

output "subnet_public1_id" {
  value = aws_subnet.subnet_public-1.id
}

output "subnet_public2_id" {
  value = aws_subnet.subnet_public-2.id
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}