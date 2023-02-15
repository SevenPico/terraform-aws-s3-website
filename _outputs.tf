## ----------------------------------------------------------------------------
##  Copyright 2023 SevenPico, Inc.
##
##  Licensed under the Apache License, Version 2.0 (the "License");
##  you may not use this file except in compliance with the License.
##  You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
##  Unless required by applicable law or agreed to in writing, software
##  distributed under the License is distributed on an "AS IS" BASIS,
##  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##  See the License for the specific language governing permissions and
##  limitations under the License.
## ----------------------------------------------------------------------------

## ----------------------------------------------------------------------------
##  ./_outputs.tf
##  This file contains code written by SevenPico, Inc.
## ----------------------------------------------------------------------------

output "s3_origin_bucket_id" {
  value = module.cdn.s3_bucket
}

output "s3_origin_bucket_arn" {
  value = module.cdn.s3_bucket_arn
}

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
