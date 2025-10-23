# dev infrastructure
module "dev_infra" {
  source = "./infra-app"

  env                  = "dev"
  ec2_ami              = "ami-0c02fb55956c7d316"
  instance_type        = "t2.micro"
  instance_count       = 1
  hash_key             = "LockID"
  bucket_name          = "infra-app-bucket"
  volume_type          = "gp2"
  ec2_root_volume_size = 8 # Add this line with desired size in GB
}

module "steging_infra" {
  source = "./infra-app"

  env                  = "staging"
  ec2_ami              = "ami-0c02fb55956c7d316"
  instance_type        = "t2.small"
  instance_count       = 2
  hash_key             = "LockID"
  bucket_name          = "infra-app-bucket"
  volume_type          = "gp3"
  ec2_root_volume_size = 10 # Add this line with desired size in GB

}

module "prd_infra" {
  source = "./infra-app"

  env                  = "prd"
  ec2_ami              = "ami-0c02fb55956c7d316"
  instance_type        = "t2.medium"
  instance_count       = 3
  hash_key             = "LockID"
  bucket_name          = "infra-app-bucket"
  volume_type          = "io1"
  ec2_root_volume_size = 20 # Add this line with desired size in GB 

}