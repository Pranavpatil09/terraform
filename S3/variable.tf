variable "aws_s3_bucket_name" {
  description = "This will be the bucket name"
  type        = string
  default     = "pranav-demo-bucket-2024"
}

variable "region" {
  description = "This will be the region for s3 bucket"
  type        = string
  default     = "ap-south-1"
}