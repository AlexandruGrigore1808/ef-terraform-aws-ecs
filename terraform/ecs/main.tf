resource "aws_ecs_cluster" "ecs_cluster" {

  name = var.cluster_name

  setting {
    name  = "containerInsights"
    value = var.is_container_insights_enabled
  }
}

module "task_role" {

  source = "../iam/main.tf"

  is_iam_policy                               = true
  is_iam_assume_role                          = true
  is_iam_policy_attached                      = true
  iam_policies                                = var.task_policy_map
  assume_role_name                            = var.task_role_name
  assume_role_policy                          = var.task_assume_role_policy
  assume_role_permissions_boundary_policy_arn = var.task_service_boundary
  assume_role_policies                        = var.task_policy_arns
  assume_role_tags                            = var.tags
}

module "execution_role" {

  source = "../iam/main.tf"

  is_iam_assume_role                          = true
  assume_role_name                            = var.execution_role_name
  assume_role_policy                          = var.execution_assume_role_policy
  assume_role_permissions_boundary_policy_arn = var.execution_service_boundary
  assume_role_policies                        = ["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]
  assume_role_tags                            = var.tags
}

resource "aws_ecs_task_definition" "task_definition" {

  family                   = var.task_definition_family
  container_definitions    = var.container_definitions
  task_role_arn            = module.task_role.role_arn
  execution_role_arn       = module.execution_role.role_arn
  network_mode             = var.network_mode
  ipc_mode                 = var.ipc_mode
  pid_mode                 = var.pid_mode
  cpu                      = var.cpu
  memory                   = var.memory
  requires_compatibilities = var.requires_compatibilities
}

resource "aws_ecs_service" "ecs_service" {

  name            = var.service_name
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn

  deployment_controller {
    type = var.deployment_controller_type
  }

  # When scheduling strategy is DAEMON, some values cannot be used.
  deployment_maximum_percent         = var.scheduling_strategy == "DAEMON" ? null : var.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  desired_count                      = var.scheduling_strategy == "DAEMON" ? null : var.desired_count
  enable_ecs_managed_tags            = var.enable_ecs_managed_tags
  force_new_deployment               = var.force_new_deployment
  launch_type                        = var.launch_type

  # This attribute is only applicable if the platform version is fargate
  platform_version      = var.platform_version != "FARGATE" ? null : var.platform_version
  propagate_tags        = var.propagate_tags
  scheduling_strategy   = var.scheduling_strategy
  wait_for_steady_state = var.wait_for_steady_state

  dynamic "network_configuration" {
    for_each = [var.network_configuration]
    content {
      subnets          = network_configuration.value["subnets"]
      security_groups  = network_configuration.value["security_groups"]
      assign_public_ip = network_configuration.value["assign_public_ip"]
    }
  }
}