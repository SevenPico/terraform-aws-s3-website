variable "waf_enabled" {
  type = bool
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
