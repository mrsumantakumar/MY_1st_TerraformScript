terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.17.0"
    }
  }
  backend "s3" {
  bucket = "romote-infra-demo-bucket-2005"
  key    = "remote-infra/terraform.tfstate"
  region = "us-east-1"
  dynamodb_table = "remote-infra-dynamodb-table"
}


}


