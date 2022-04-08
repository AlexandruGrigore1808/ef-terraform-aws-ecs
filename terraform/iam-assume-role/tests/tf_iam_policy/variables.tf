#### IAM Assume Role ####

variable "terratest_s3_policy_name" {
  description = "Name for IAm Policy"
  type        = string
}

variable "terratest_ec2_policy_name" {
  description = "Name for IAm Policy"
  type        = string
}

variable "role_name" {
  description = "Name for IAm Role"
  type        = string
}

variable "managed_policy_arn" {
  description = "(Optional) List of managed policy arns for mapping to IAM role"
  type        = list
  default = ["arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM",
  "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"]
}