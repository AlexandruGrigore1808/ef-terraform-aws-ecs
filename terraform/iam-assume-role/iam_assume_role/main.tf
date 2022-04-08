resource "aws_iam_role" "role" {

  name                 = var.role_name
  assume_role_policy   = var.assume_role_policy
  permissions_boundary = var.permissions_boundary_policy_arn
  max_session_duration = var.max_session_duration
  tags                 = var.tags
}

resource "aws_iam_role_policy_attachment" "attachPolicy" {

  for_each   = toset(var.policy_arn)
  role       = aws_iam_role.role.name
  policy_arn = each.value
}