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
##  ./waf.tf
##  This file contains code written by SevenPico, Inc.
## ----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# WAF
# -----------------------------------------------------------------------------
module "waf_context" {
  source     = "SevenPico/context/null"
  version    = "2.0.0" # requires Terraform >= 0.13.0
  context    = module.context.self
  enabled    = module.context.enabled && var.waf_enabled
  attributes = ["waf"]
}

# FIXME ??
module "waf" {
  count = module.waf_context.enabled ? 1 : 0

  source  = "registry.terraform.io/trussworks/wafv2/aws"
  version = "2.4.0"

  name = module.waf_context.enabled ? module.waf_context.id : "NA"
  tags = module.waf_context.enabled ? module.waf_context.tags : {}

  alb_arn        = null
  associate_alb  = false
  default_action = "allow"
  filtered_header_rule = {
    "action" : "block",
    "header_types" : [],
    "header_value" : "",
    "priority" : 1
  }
  group_rules = []
  ip_rate_based_rule = {
    name     = "${module.waf_context.id}-rate-limit"
    priority = 1
    limit    = 10000
    action   = "block"
  }
  ip_rate_url_based_rules = []
  ip_sets_rule            = []

  managed_rules = [
    {
      excluded_rules : [],
      name : "AWSManagedRulesCommonRuleSet",
      override_action : "none",
      priority : 10
    },
    {
      excluded_rules : [],
      name : "AWSManagedRulesAmazonIpReputationList",
      override_action : "none",
      priority : 20
    },
    {
      excluded_rules : [],
      name : "AWSManagedRulesKnownBadInputsRuleSet",
      override_action : "none",
      priority : 30
    },
    {
      excluded_rules : [],
      name : "AWSManagedRulesSQLiRuleSet",
      override_action : "none",
      priority : 40
    },
    {
      excluded_rules : [],
      name : "AWSManagedRulesLinuxRuleSet",
      override_action : "none",
      priority : 50
    },
    {
      excluded_rules : [],
      name : "AWSManagedRulesUnixRuleSet",
      override_action : "none",
      priority : 60
    },
    {
      excluded_rules : [],
      name : "AWSManagedRulesAnonymousIpList",
      override_action : "none",
      priority : 70
    },
  ]
  scope = "CLOUDFRONT"
}
