variable "region" {
  description = "This is the region for s3 bucket"
  default = "ap-south-1"
}

variable "aws_s3_bucket_name" {
  description = "This will be the bucket name"
  type        = string
  default     = "pranav-webapp-bucket-20052002"
}