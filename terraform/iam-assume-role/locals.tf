locals {
  #### IAM Assume Role ####

  is_iam_policy_attached = var.is_iam_policy_attached ? module.iam_policy : null

}