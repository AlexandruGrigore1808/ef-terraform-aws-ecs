output "role_arn" {
  description = "The ARN of the IAM role"
  value       = aws_iam_role.role.arn
}

output "role_id" {
  description = "The ID of the IAM role"
  value       = aws_iam_role.role.id
}

output "role_name§" {
  description = "The Name of the IAM role"
  value       = aws_iam_role.role.name
}