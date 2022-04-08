resource "aws_iam_instance_profile" "instance_profile" {
  
  name = var.name
  path = var.path
  role = var.role_name
}