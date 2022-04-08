data "aws_iam_account_alias" "current" {}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "task_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "execution_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
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