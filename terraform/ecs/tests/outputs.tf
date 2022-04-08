output "cluster_name" {
  description = "Name for the ECS Cluster"
  value = module.ecs.cluster_name
}

output "cluster_arn" {
  description = "ARN for the ECS Cluster"
  value = module.ecs.cluster_ar
}

#### Service Info ####

output "service_name" {
  description = "Name for the ECS Service"
  value = module.ecs.service_name
}

output "task_definition" {
    description = "The ARN of the task definition for the ECS task"
    value = module.ecs.task_definition
}