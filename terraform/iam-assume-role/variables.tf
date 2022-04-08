#### IAM Policy ####

variable "is_iam_policy" {
  description = "Is the iam policy used."
  default     = false
  type        = bool
}

variable "iam_policies" {
  type = map(object({
    description = any
    name        = any
    path        = any
    policy      = any
  }))
  description = "A list of maps describing policy documents"
  default     = {}
}

#### IAM Assume Role ####

variable "is_iam_assume_role" {
  description = "Is the iam assume role used."
  default     = false
  type        = bool
}

variable "is_iam_policy_attached" {
  description = "Is an Iam policy created in the Iam Policy module attached to the role."
  default     = false
  type        = bool
}

variable "assume_role_name" {
  description = "Application Name for IAm Role"
  type        = string
  default     = ""
}

variable "assume_role_policy" {
  description = "Policy for assume role"
  type        = string
  default     = ""
}

variable "assume_role_policies" {
  description = "(Optional) List of policy arns for mapping to IAM role"
  type        = list
  default     = []
}

variable "assume_role_permissions_boundary_policy_arn" {
  description = "Permission boundary for role creation"
  type        = string
  default     = ""
}

variable "assume_role_tags" {
  description = "Tags to apply to AWS resources"
  type        = map(string)
  default     = {}
}

variable "max_session_duration" {
  description = "Maximum session duration (in seconds) that you want to set for the specified role. This setting can have a value from 1 hour to 12 hours."
  type        = number
  default     = 3600
}

#### IAM Instance Profile ####

variable "is_iam_instance_profile" {
  description = "Is the iam instance profile used."
  type        = bool
  default     = false
}

variable "instance_profile_name" {
  description = "The name of the profile. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = ""
}

variable "instance_profile_path" {
  description = "(Optional) Path in which to create the policy."
  type        = string
  default     = "/"
}

variable "instance_profile_role" {
  description = "The name of the role to assign to the instance profile."
  type        = string
  default     = ""
}