terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.41.0"
    }
  }
}

provider "aws" {
    region = var.region
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = var.aws_s3_bucket_name

  tags = {
    Name        = "My Demo Bucket"
  }
  
}

resource "aws_s3_object" "demo_object" {
    bucket  = aws_s3_bucket.demo_bucket.bucket
    key     = "data.txt"
    source = "file.txt"
}