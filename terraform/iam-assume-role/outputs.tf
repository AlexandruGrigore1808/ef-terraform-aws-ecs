#### IAM Policy ####

output "policy_arn" {
  description = "List of policy arns."
  value       = var.is_iam_policy ? module.iam_policy.*.policy_arn[0] : null
}

output "policy_name" {
  description = "List of policy names."
  value       = var.is_iam_policy ? module.iam_policy.*.policy_name[0] : null
}

#### IAM Assume Role ####

output "role_arn" {
  description = "Iam role arn."
  value       = var.is_iam_assume_role ? join("", module.iam_assume_role.*.role_arn) : null
}

output "role_id" {
  description = "Iam role id."
  value       = var.is_iam_assume_role ? join("", module.iam_assume_role.*.role_id) : null
}

output "role_name" {
  description = "Iam role name."
  value       = var.is_iam_assume_role ? join("", module.iam_assume_role.*.role_name) : null
}

#### IAM Instance Profile ####

output "profile_id" {
  description = "Instance profile id."
  value       = var.is_iam_instance_profile ? join("", module.iam_instance_profile.*.profile_id) : null
}

output "profile_arn" {
  description = "Instance profile arn."
  value       = var.is_iam_instance_profile ? join("", module.iam_instance_profile.*.profile_arn) : null
}

output "profile_name" {
  description = "Instance profile name."
  value       = var.is_iam_instance_profile ? join("", module.iam_instance_profile.*.profile_name) : null
}