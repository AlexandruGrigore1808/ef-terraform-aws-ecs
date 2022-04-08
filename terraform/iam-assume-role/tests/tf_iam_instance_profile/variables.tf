#### IAM Assume Role ####

variable "role_name" {
  description = "Application Name for IAm Role"
}

variable "managed_policy_arn" {
  description = "(Optional) List of managed policy arns for mapping to IAM role"
  default = ["arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM",
  "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"]
}

#### IAM Instance Profile ####

variable "instance_profile_path" {
  description = "(Optional) Path in which to create the policy."
  type        = string
  default     = "/"
}

variable "instance_profile_name" {
  description = "The name of the instance profile the instance profile."
  type        = string
  default     = ""
}