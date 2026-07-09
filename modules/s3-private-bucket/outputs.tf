output "bucket_name" {
  value       = aws_s3_bucket.private_bucket.id
  description = "The name of the S3 bucket"
}

output "bucket_arn" {
  value       = aws_s3_bucket.private_bucket.arn
  description = "The ARN of the S3 bucket"
}

output "bucket_id" {
  value       = aws_s3_bucket.private_bucket.id
  description = "The ID of the S3 bucket"
}

output "regional_domain_name" {
  value       = aws_s3_bucket.private_bucket.regional_domain_name
  description = "The regional domain name of the S3 bucket"
}

output "website_endpoint" {
  value       = aws_s3_bucket.private_bucket.website_endpoint
  description = "The website endpoint of the S3 bucket"
}
