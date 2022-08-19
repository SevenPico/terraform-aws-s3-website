output "cloudfront_domain_name" {
  value = module.cdn.cf_domain_name
}

output "cloudfront_aliases" {
  value = module.cdn.aliases
}

output "cloudfront_origin_s3_bucket_arn" {
  value = module.cdn.s3_bucket_arn
}

output "cloudfront_origin_s3_bucket_id" {
  value = module.cdn.s3_bucket
}

output "cloudfront_id" {
  value       = module.cdn.cf_id
  description = "ID of AWS CloudFront distribution"
}

output "cloudfront_arn" {
  value       = module.cdn.cf_arn
  description = "ARN of AWS CloudFront distribution"
}
