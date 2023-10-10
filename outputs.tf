output "bucket_name" {
  description = "Bucket name for our static website"
  value       = module.home_germany_hosting.bucket_name
}

output "s3_website_endpoint" {
  description = "S3 Static Website hosting endpoint"
  value       = module.home_germany_hosting.website_endpoint
}

output "cloudfront_url" {
  description = "The cloudfront distribution domain name"
  value       = module.home_germany_hosting.domain_name
}