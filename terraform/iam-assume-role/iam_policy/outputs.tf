#### IAM policy ###

output "policy_arn" {
  description = "List of IAM policy ARNs"
  value = [
      for p in aws_iam_policy.policy : p.arn
  ]
}

output "policy_name" {
  description = "List of IAM policy names"
  value = [
      for p in aws_iam_policy.policy : p.name
  ]
}