variable "role_name" {
  description = "Application Name for IAm Role"
}

variable "managed_policy_arn" {
  description = "(Optional) List of managed policy arns for mapping to IAM role"
  type        = list
  default = ["arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM",
  "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"]
}