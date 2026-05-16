terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.45.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "s3" {
  bucket = "terraform-practice-bucket-2026"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  } 
}

resource "aws_instance" "ec2" {
  ami = "ami-0f5ee92e2d63afc18"
  instance_type = "t3.micro"
  tags = {
    Name = "TerraWeek-Modified"
  }
}


