################################################################################
# This file is used to define input variables for your Terraform VPC module. modules/vpc/variables.tf
################################################################################

variable "vpc_cidr" {}

variable "availability_zone_one" { 
}

variable "availability_zone_two" { 
}

variable "public_cidrs" {
   description = "cidr block for the subnet"
  type =  list(object({
    cidr_block  = string
    name = string
  }))
}

