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
##  ./_variables.tf
##  This file contains code written by SevenPico, Inc.
## ----------------------------------------------------------------------------

variable "waf_enabled" {
  type    = bool
  default = false
}

variable "default_root_object" {
  type    = string
  default = "index.html"
}

variable "acm_certificate_arn" {
  type = string
}

variable "additional_aliases" {
  type    = list(string)
  default = []
}

variable "custom_error_response" {
  type = list(any)
  default = [{
    error_code            = 404
    response_code         = 404
    response_page_path    = "/index.html"
    error_caching_min_ttl = 10
  }]
}

variable "s3_access_log_storage_bucket_id" {
  type    = string
  default = ""
}

variable "cloudfront_access_logging_enabled" {
  type    = bool
  default = false
}

variable "s3_access_logging_enabled" {
  type = bool
  default = true
}

variable "cloudfront_access_log_storage_bucket_id" {
  type    = string
  default = ""
}

variable "cors_allowed_origins" {
  type    = list(string)
  default = []
}

variable "deployment_principal_arns" {
  type    = list(string)
  default = []
}

variable "parent_zone_id" {
  type        = string
  default     = ""
  description = "ID of the hosted zone to contain this record (or specify `parent_zone_name`). Requires `dns_alias_enabled` set to true"
}

variable "parent_zone_name" {
  type        = string
  default     = ""
  description = "Name of the hosted zone to contain this record (or specify `parent_zone_id`). Requires `dns_alias_enabled` set to true"
}

variable "dns_alias_enabled" {
  type        = bool
  default     = false
  description = "Create a DNS alias for the CDN. Requires `parent_zone_id` or `parent_zone_name`"
}
variable "tls_protocol_version" {
  type    = string
  default = "TLSv1.2_2021"
}

variable "geo_restriction_type" {
  type        = string
  default     = "none"
  description = "Method that use to restrict distribution of your content by country: `none`, `whitelist`, or `blacklist`"
}

variable "geo_restriction_locations" {
  type        = list(string)
  default     = []
  description = "List of country codes for which  CloudFront either to distribute content (whitelist) or not distribute your content (blacklist)"
}

variable "s3_object_ownership" {
  type        = string
  default     = "BucketOwnerEnforced"
  description = "Specifies the S3 object ownership control on the origin bucket. Valid values are `ObjectWriter`, `BucketOwnerPreferred`, and 'BucketOwnerEnforced'."
}

variable "cloudfront_function_association" {
  type = list(any)
  default = []
  description = <<-EOT
  List of objects representing CloudFront function associations.
  Syntax:-
    list(object({
        event_type   = string 
        function_arn = string
  }))
  event_type: the type of event that triggers the function. Valid values are "viewer-request", "viewer-response", "origin-request" and "origin-response".
  function_arn: the ARN of the CloudFront function.
  EOT
}