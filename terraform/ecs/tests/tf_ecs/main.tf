module "ecs" {

  source = "../../"

  cluster_name                  = "aws-ecs-example-cluster"
  service_name                  = "aws-ecs-example-service"
  task_role_name                = "aws-ecs-example-task-role"
  task_assume_role_policy       = data.aws_iam_policy_document.execution_assume_role_policy.json
  task_service_boundary         = local.service_boundary
  task_policy_map               = local.task_policy
  task_policy_arns              = ["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]
  execution_role_name           = "aws-ecs-example-execution-role"
  execution_assume_role_policy  = data.aws_iam_policy_document.execution_assume_role_policy.json
  execution_service_boundary    = local.service_boundary
  is_container_insights_enabled = "enabled"
  task_definition_family        = "aws-ecs-example-family"
  container_definitions         = local.container_definition
  network_mode                  = "awsvpc"
  cpu                           = "256"
  memory                        = "512"
  launch_type                   = "FARGATE"

  # Account for the fact that the default is "FARGATE"
  network_configuration = {
    subnets          = ["subnet-000000000000000001"]
    security_groups  = ["sg-0000000000000001"]
    assign_public_ip = false
  }

  requires_compatibilities = ["FARGATE"]
  tags                     = local.tags
  desired_count            = 1
}