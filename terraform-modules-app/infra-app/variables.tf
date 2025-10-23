variable "env" {
 description = " This is the Environment for my terraform deployment"
 type = string

}
variable "bucket_name" {
 description = " This is the S3 Bucket Name"
 type = string
 
}

variable "instance_count"  {
  description = "Number of EC2 instances to create"
  type        = number
  
}


variable "instance_type" {
    description = "Type of EC2 instance"
    type        = string
  
}

variable "ec2_ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  
} 
variable "ec2_root_volume_size" {
    description = "Root volume size in GB"
    type        = number
  
}
variable "hash_key" {
  description = "Hash key for DynamoDB table"
  type        = string
  
}

variable "volume_type" {
  description = "Type of EBS volume"
  type        = string

  
}