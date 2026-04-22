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

resource "aws_s3_bucket" "webapp_bucket" {
  bucket = var.aws_s3_bucket_name
}

resource "aws_s3_object" "Index_html" {
  bucket = var.aws_s3_bucket_name
  key    = "index.html"
  source = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "Style_css" {
  bucket = var.aws_s3_bucket_name
  key    = "style.css"
  source = "style.css"
  content_type = "text/css"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.webapp_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
  
resource "aws_s3_bucket_policy" "webapp" {
    bucket = var.aws_s3_bucket_name
    
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Effect = "Allow"
            Principal = "*"
            Action = "s3:GetObject"
            Resource = "${aws_s3_bucket.webapp_bucket.arn}/*"
        }
        ]
    })
}

resource "aws_s3_bucket_website_configuration" "webapp_bucket" {
  bucket = aws_s3_bucket.webapp_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

