#### Cluster Info ####

output "cluster_name" {
  description = "Name for the ECS Cluster"
  value = aws_ecs_cluster.ecs_cluster.name
}

output "cluster_arn" {
  description = "ARN for the ECS Cluster"
  value = aws_ecs_cluster.ecs_cluster.arn
}

#### Service Info ####

output "service_name" {
  description = "Name for the ECS Service"
  value = aws_ecs_service.ecs_service.name
}

output "task_definition" {
    description = "The ARN of the task definition for the ECS task"
    value = aws_ecs_task_definition.task_definition.arn
}