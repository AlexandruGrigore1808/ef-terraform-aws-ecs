resource "aws_iam_policy" "policy" {

  for_each    = var.iam_policies
  description = each.value.description
  name        = each.value.name
  path        = each.value.path
  policy      = each.value.policy
}