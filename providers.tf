provider "aws" {
  profile = var.aws_profile
  default_tags {
    tags = local.common_tags
  }
}