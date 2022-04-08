data "aws_iam_account_alias" "current" {}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "terratest_s3_policy" {
  statement {
    sid       = "TerratestS3Policy"
    actions   = ["s3:*"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "terratest_ec2_policy" {
  statement {
    sid       = "TerratestEC2Policy"
    actions   = ["ec2:*"]
    resources = ["*"]
  }
}