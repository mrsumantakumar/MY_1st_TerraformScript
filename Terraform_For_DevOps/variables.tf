variable "ec2_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"

}
variable "ec2_ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c398cb65a93047f2"
}
variable "ec2_default_root_volume_size" {
  description = "Root volume size in GB"
  type        = number
  default     = 10

}

variable "env" {
  description = "Environment"
  type        = string
  default     = "prd"
  
}
