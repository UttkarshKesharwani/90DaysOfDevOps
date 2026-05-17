provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "s3" {
  bucket = "my-random-s3-bucket-uttkarsh-kesharwani"
  # depends_on = [ aws_instance.ec2 ]
}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.s3.id
  versioning_configuration {
    status = "Enabled"
  }
}

