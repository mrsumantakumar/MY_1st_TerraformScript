resource "aws_s3_bucket" "demo_bucket" {
  bucket = "romote-infra-demo-bucket-2005"

  tags = {
    Name        = "remote-infra-demo-bucket"
  
  }
}