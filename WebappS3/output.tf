output "web_url" {
  value = aws_s3_bucket_website_configuration.webapp_bucket.website_endpoint
  description = "The website endpoint for the S3 bucket"
}
