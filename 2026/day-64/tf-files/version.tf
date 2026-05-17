
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "my-random-s3-bucket-uttkarsh-kesharwani"
    key = "learning-terraform/terraform.tfstate"
    use_lockfile = true
    encrypt = true
    region       = "ap-south-1"
  }
  required_version = ">= 1.5.0"
}