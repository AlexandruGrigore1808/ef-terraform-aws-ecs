variable "assume_role_policy" {
  description = "Policy for assume role"
}

variable "role_name" {
  description = "Application Name for IAm Role"
}

variable "policy_arn" {
  description = " Policy arn for mapping to IAM role"
  default     = []
}

variable "permissions_boundary_policy_arn" {
  description = "Permission boundary for role creation"
  type        = string
  default     = ""
}

variable "max_session_duration" {
  description = "Maximum session duration (in seconds) that you want to set for the specified role. This setting can have a value from 1 hour to 12 hours."
  type        = number
  default     = 3600
}

variable "tags" {
  description = "Tags to apply to AWS resources"
  type        = map(string)
}