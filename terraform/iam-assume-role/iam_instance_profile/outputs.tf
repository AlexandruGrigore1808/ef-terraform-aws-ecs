output "profile_id" {
  description = "The ID of the IAM instance profile"
  value       = aws_iam_instance_profile.instance_profile.id
}

output "profile_arn" {
  description = "The ARN of the IAM instance profile"
  value       = aws_iam_instance_profile.instance_profile.arn
}
  
output "profile_name" {
  description = "The Name of the IAM instance profile"
  value       = aws_iam_instance_profile.instance_profile.name
}