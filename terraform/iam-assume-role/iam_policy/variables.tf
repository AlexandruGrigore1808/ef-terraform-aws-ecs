variable "iam_policies" {
  type = map(object({
    description = any
    name        = any
    path        = any
    policy      = any
  }))
  description = "A list of maps describing policy documents"
  default = {}
}