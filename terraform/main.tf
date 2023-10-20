################################################################################
# This main file includes the modules and resources that you want to create.
################################################################################

###### root/main.tf

# here you just define your variables valuses for your eks module
module "eks" {
  source                  = "./modules/eks"
  cluster_name            = "my-eks-cluster"
  vpc_id = module.vpc.vpc_id    # this value comes from vpc outputs 
  subnet_public1_id = module.vpc.subnet_public1_id # this value comes from vpc outputs 
  subnet_public2_id = module.vpc.subnet_public2_id  # this value comes from vpc outputs 
  node_group_name = "eks-node-group"
  instance_type = "t2.micro"
  ec2_ssh_key = "abdessamad-ssh"
  capacity_type = "ON_DEMAND"
  security_group_name     = "my-security-group"
  scaling_desired_size    = 2
  scaling_max_size        = 2
  scaling_min_size        = 1

}

# here you just define your variables valuses for your vpc module
module "vpc" {
  source                  = "./modules/vpc"
  vpc_cidr                = "10.0.0.0/16"
  availability_zone_one   = "us-east-1a"
  availability_zone_two   = "us-east-1b"
  public_cidrs            =  [{cidr_block="10.0.1.0/24" , name="public-subnet-1"},{cidr_block="10.0.2.0/24" , name="public-subnet-2"}]

}


