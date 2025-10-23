module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "~> 5.5.0"

  name = "${local.name}_vpc"
  cidr = "10.0.0.0/16"

  azs             = local.azs
  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets
  

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = local.env
  }
}