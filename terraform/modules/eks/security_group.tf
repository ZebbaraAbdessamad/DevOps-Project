resource "aws_security_group" "my_security_group" {
  name        = var.security_group_name
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  #ssh
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #http
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #kubernetes service ( node port)
  ingress {
    from_port   = 31786
    to_port     = 31786
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #hhtps
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

   tags = {
    Name = "my-security-group"
  }
}
