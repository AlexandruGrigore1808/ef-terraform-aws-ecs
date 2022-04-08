module "iam_assume_role" {

  source                                      = "../../"
  is_iam_assume_role                          = true
  is_iam_instance_profile                     = true
  assume_role_name                            = var.role_name
  assume_role_policy                          = data.aws_iam_policy_document.assume_role_policy.json
  assume_role_permissions_boundary_policy_arn = local.service_boundary
  assume_role_policies                        = var.managed_policy_arn
  max_session_duration                        = 3600
  assume_role_tags                            = local.tags
  instance_profile_name                       = var.instance_profile_name
  instance_profile_path                       = var.instance_profile_path
  instance_profile_role                       = module.iam_assume_role.role_name
}