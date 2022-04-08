output "role_arn" {
  value = module.iam_assume_role.role_arn
}

output "role_id" {
  value = module.iam_assume_role.role_id
}

output "role_name" {
  value = module.iam_assume_role.role_name
}