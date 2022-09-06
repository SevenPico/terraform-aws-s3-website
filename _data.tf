data "aws_caller_identity" "current" {
  count = module.context.enabled ? 1 : 0
}
