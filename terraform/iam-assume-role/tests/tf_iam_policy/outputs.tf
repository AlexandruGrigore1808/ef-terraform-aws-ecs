#### IAM Assume Role ####

output "role_arn" {
  value = module.iam_assume_role.role_arn
}

output "role_name" {
  value = module.iam_assume_role.role_name
}

#### IAM Policy ####

output "policy_arn" {
  value = module.iam_assume_role.policy_arn
}

output "policy_name" {
  value = module.iam_assume_role.policy_name
}