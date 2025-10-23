#Key Pair (login)

resource "aws_key_pair" "deployer" {
  key_name   = "${var.env}-terra-key-ec2_new"
  public_key = file("terra-key-ec2.pub")
  tags = {
    Environment = var.env
  }
}

#VPC & Security Group

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_security_group" {
  name        = "${var.env}-terrform_ec2_sg"
  description = "This security group is for terraform ec2 instance"
  vpc_id      = aws_default_vpc.default.id #Interpolation
  # Inbound Rules

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH traffic"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP traffic"
  }

  #Outbound Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.env}-terraform_ec2_sg"
  }

}
#ec2 Instance



resource "aws_instance" "my_ec2_instance" {
  #count           = 3 #Meta Argument for multiple instances

  for_each = tomap({ #Meta Argument for multiple instances
    web1 = "gp3"
    web2 = "gp2"

  })
  depends_on = [aws_security_group.my_security_group, aws_key_pair.deployer] #Dependency

  ami             = var.ec2_ami
  instance_type   = var.ec2_type
  key_name        = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.my_security_group.name] #Security Group attachment

  #Volume configuration

  root_block_device {
   # volume_size = var.ec2_root_volume_size
    volume_size = var.env == "prd" ? 20 : var.ec2_default_root_volume_size
    volume_type = each.value
  }
  user_data = file("nginx.sh")
  tags = {
    Name = each.key
  }

}





