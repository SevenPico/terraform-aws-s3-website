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
  default     = "BucketOwnerPreferred"
  description = "Specifies the S3 object ownership control on the origin bucket. Valid values are `ObjectWriter`, `BucketOwnerPreferred`, and 'BucketOwnerEnforced'."
}