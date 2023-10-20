resource "aws_subnet" "subnet_public-1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_cidrs[0].cidr_block 
  availability_zone       =  var.availability_zone_one
  # specifies whether newly launched instances in that subnet should be automatically assigned a public IP address.
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_cidrs[0].name
  }
}

resource "aws_subnet" "subnet_public-2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_cidrs[1].cidr_block 
  availability_zone       =  var.availability_zone_two
  # specifies whether newly launched instances in that subnet should be automatically assigned a public IP address.
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_cidrs[1].name
  }
}
