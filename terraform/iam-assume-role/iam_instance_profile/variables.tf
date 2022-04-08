variable "name" {
  description = "The name of the profile. If omitted, Terraform will assign a random, unique name."
  type        = string
}

variable "path" {
  description = "(Optional) Path in which to create the policy."
  type        = string
  default     = "/"
}

variable "role_name" {
  description = "The role name to include in the profile."
  type        = string
}