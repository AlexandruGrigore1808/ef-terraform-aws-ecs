#### IAM Assume Role ####

output "role_arn" {
  value = module.iam_assume_role.role_arn
}

output "role_id" {
  value = module.iam_assume_role.role_id
}

output "role_name" {
  value = module.iam_assume_role.role_name
}

#### IAM Instance Profile ####

output "profile_id" {
  value = module.iam_assume_role.profile_id
}

output "profile_arn" {
  value = module.iam_assume_role.profile_arn
}

output "profile_name" {
  value = module.iam_assume_role.profile_name
}