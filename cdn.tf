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
##  ./cdn.tf
##  This file contains code written by SevenPico, Inc.
## ----------------------------------------------------------------------------

module "cdn" {
  source  = "cloudposse/cloudfront-s3-cdn/aws"
  version = "0.95.0"
  context = module.context.self

  acm_certificate_arn                       = var.acm_certificate_arn
  additional_bucket_policy                  = "{}"
  aliases                                   = compact(concat([module.context.dns_name], var.additional_aliases))
  allowed_methods                           = ["GET", "HEAD"]
  block_origin_public_access_enabled        = true
  cached_methods                            = ["GET", "HEAD"]
  cache_policy_id                           = null
  cloudfront_access_log_bucket_name         = var.cloudfront_access_log_storage_bucket_id
  cloudfront_access_log_create_bucket       = false
  cloudfront_access_logging_enabled         = var.cloudfront_access_logging_enabled
  cloudfront_access_log_include_cookies     = false
  cloudfront_access_log_prefix              = var.cloudfront_access_log_prefix
  cloudfront_origin_access_identity_iam_arn = ""
  cloudfront_origin_access_identity_path    = ""
  comment                                   = "Managed by Terraform"
  compress                                  = true
  cors_allowed_headers                      = ["*"]
  cors_allowed_methods                      = ["GET", "HEAD"]
  cors_allowed_origins                      = var.cors_allowed_origins
  cors_expose_headers                       = ["ETag"]
  cors_max_age_seconds                      = 3600
  custom_error_response                     = var.custom_error_response
  custom_origin_headers                     = []
  custom_origins                            = []
  default_root_object                       = var.default_root_object
  default_ttl                               = 60
  deployment_actions                        = ["s3:PutObject", "s3:PutObjectAcl", "s3:GetObject", "s3:DeleteObject", "s3:ListBucket", "s3:ListBucketMultipartUploads", "s3:GetBucketLocation", "s3:AbortMultipartUpload"]
  deployment_principal_arns                 = { for principal in var.deployment_principal_arns : "${principal}" => [""] }
  distribution_enabled                      = true
  dns_alias_enabled                         = var.dns_alias_enabled
  encryption_enabled                        = true
  external_aliases                          = []
  extra_logs_attributes                     = ["logs"]
  extra_origin_attributes                   = ["origin"]
  forward_cookies                           = "none"
  forward_header_values                     = ["Access-Control-Request-Headers", "Access-Control-Request-Method", "Origin"]
  forward_query_string                      = false
  function_association                      = var.cloudfront_function_association
  geo_restriction_locations                 = var.geo_restriction_locations
  geo_restriction_type                      = var.geo_restriction_type
  ipv6_enabled                              = true
  lambda_function_association               = []
  log_expiration_days                       = 90
  log_glacier_transition_days               = 60
  log_standard_transition_days              = 30
  log_versioning_enabled                    = false
  max_ttl                                   = 31536000
  minimum_protocol_version                  = var.tls_protocol_version
  min_ttl                                   = 0
  ordered_cache                             = []
  origin_bucket                             = null
  origin_force_destroy                      = true
  origin_groups                             = []
  origin_path                               = ""
  origin_request_policy_id                  = null
  origin_ssl_protocols                      = ["TLSv1.2"]
  override_origin_bucket_policy             = false
  parent_zone_id                            = var.parent_zone_id
  parent_zone_name                          = var.parent_zone_name
  price_class                               = "PriceClass_100"
  query_string_cache_keys                   = []
  redirect_all_requests_to                  = ""
  response_headers_policy_id                = var.response_headers_policy_id
  routing_rules                             = ""
  s3_access_log_bucket_name                 = var.s3_access_log_storage_bucket_id
  s3_access_logging_enabled                 = var.s3_access_logging_enabled
  s3_access_log_prefix                      = var.s3_access_log_prefix
  s3_object_ownership                       = var.s3_object_ownership
  s3_origins                                = []
  s3_website_password_enabled               = false
  trusted_key_groups                        = []
  trusted_signers                           = []
  bucket_versioning                         = "Enabled"
  viewer_protocol_policy                    = "redirect-to-https"
  wait_for_deployment                       = true
  web_acl_id                                = module.waf_context.enabled ? module.waf[0].web_acl_id : ""
  website_enabled                           = false
}