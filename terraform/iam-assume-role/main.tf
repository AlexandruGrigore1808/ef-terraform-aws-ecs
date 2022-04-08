module iam_policy {

  count        = var.is_iam_policy ? 1 : 0
  source       = "./iam_policy/"
  iam_policies = var.iam_policies
}

module iam_assume_role {

  count                           = var.is_iam_assume_role ? 1 : 0
  source                          = "./iam_assume_role/"
  role_name                       = var.assume_role_name
  assume_role_policy              = var.assume_role_policy
  permissions_boundary_policy_arn = var.assume_role_permissions_boundary_policy_arn
  policy_arn                      = var.assume_role_policies
  max_session_duration            = var.max_session_duration
  tags                            = var.assume_role_tags
  depends_on                      = [local.is_iam_policy_attached]
}

module iam_instance_profile {

  count     = var.is_iam_instance_profile ? 1 : 0
  source    = "./iam_instance_profile/"
  name      = var.instance_profile_name
  path      = var.instance_profile_path
  role_name = var.instance_profile_role
}