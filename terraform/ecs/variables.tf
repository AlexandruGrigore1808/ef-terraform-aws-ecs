variable "cluster_name" {
  type        = string
  description = "Name for the ECS Cluster"
}

variable "is_container_insights_enabled" {
  type        = string
  description = "(Optional) Whether or not container insights are enabled. Valid values are enabled and disabled."
  default     = null
}

variable "task_definition_family" {
  type        = string
  description = "Unique name for your task definition."
}

variable "container_definitions" {
  type        = string
  description = "The JSON representation of the container definition"
}

variable "network_mode" {
  type        = string
  description = "(Optional) The Docker networking mode to use for the containers in the task. The valid values are none, bridge, awsvpc, and host."
  default     = null
}

variable "ipc_mode" {
  type        = string
  description = "(Optional) The IPC resource namespace to be used for the containers in the task The valid values are host, task, and none."
  default     = null
}

variable "pid_mode" {
  type        = string
  description = "(Optional) The process namespace to use for the containers in the task. The valid values are host and task."
  default     = null
}

variable "deployment_controller_type" {
  type        = string
  description = "(Optional) Type of deployment controller. Valid values: CODE_DEPLOY, ECS, EXTERNAL. Default: ECS."
  default     = "ECS"
}

variable "deployment_maximum_percent" {
  type        = string
  description = "(Optional) The upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment. Not valid when using the DAEMON scheduling strategy."
  default     = null
}

variable "deployment_minimum_healthy_percent" {
  type        = string
  description = " (Optional) The lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment."
  default     = null
}

variable "desired_count" {
  type        = string
  description = " (Optional) The number of instances of the task definition to place and keep running. Defaults to 0. Do not specify if using the DAEMON scheduling strategy."
  default     = null
}

variable "enable_ecs_managed_tags" {
  type        = bool
  description = "(Optional) Specifies whether to enable Amazon ECS managed tags for the tasks within the service."
  default     = null
}

variable "force_new_deployment" {
  type        = bool
  description = "(Optional) Enable to force a new task deployment of the service. This can be used to update tasks to use a newer Docker image with same image/tag combination (e.g. myimage:latest), roll Fargate tasks onto a newer platform version, or immediately deploy ordered_placement_strategy and placement_constraints updates."
  default     = null
}

variable "launch_type" {
  type        = string
  description = "(Optional) The launch type on which to run your service. The valid values are EC2 and FARGATE. Defaults to EC2."
  default     = null
}

variable "platform_version" {
  type        = string
  description = " (Optional) The platform version on which to run your service. Only applicable for launch_type set to FARGATE. Defaults to LATEST. More information about Fargate platform versions can be found in the AWS ECS User Guide."
  default     = null
}

variable "propagate_tags" {
  type        = string
  description = "(Optional) Specifies whether to propagate the tags from the task definition or the service to the tasks. The valid values are SERVICE and TASK_DEFINITION."
  default     = null
}

variable "scheduling_strategy" {
  type        = string
  description = "(Optional) The scheduling strategy to use for the service. The valid values are REPLICA and DAEMON. Defaults to REPLICA. Note that Tasks using the Fargate launch type or the CODE_DEPLOY or EXTERNAL deployment controller types don't support the DAEMON scheduling strategy."
  default     = null
}

variable "wait_for_steady_state" {
  type        = bool
  description = "(Optional) If true, Terraform will wait for the service to reach a steady state (like aws ecs wait services-stable) before continuing. Default false"
  default     = null
}


variable "network_configuration" {
  type = object(
    {
      subnets          = list(string)
      security_groups  = list(string)
      assign_public_ip = bool
    }
  )
  description = "(Optional) The network configuration for the service. This parameter is required for task definitions that use the awsvpc network mode to receive their own Elastic Network Interface, and it is not supported for other network modes."
  default     = null
}

variable "task_role_name" {
  type        = string
  description = "Role name for the created IAM role used for the ECS Task"
}

variable "task_assume_role_policy" {
  type        = string
  description = "Assume role policy for the task IAM Role, provide as the JSON output of a policy data resource."
}

variable "task_service_boundary" {
  type        = string
  description = "Service boundary for the task iam role."
  default     = null
}

variable "task_policy_map" {
  type = map(object({
    description = string
    name        = string
    path        = string
    policy      = string
  }))
  description = "Policy map for the task policy."
}

variable "execution_role_name" {
  type        = string
  description = "Role name for the created IAM role used for the ECS execution"
}

variable "execution_assume_role_policy" {
  type        = string
  description = "Assume role policy for the execution IAM Role, provide as the JSON output of a policy data resource."
}

variable "execution_service_boundary" {
  type        = string
  description = "Service boundary for the execution iam role."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "tags"
}

variable "cpu" {
  type        = string
  description = "(Optional) The number of cpu units used by the task. If the requires_capabilities is FARGATE this field is required."
}

variable "requires_compatibilities" {
  type        = list(string)
  description = "(Optional) A set of launch types required  by the task. The valid values are EC2 and FARGATE."
}

variable "service_name" {
  type        = string
  description = "The name of the ECS Service."
}

variable "memory" {
  type        = string
  description = "How much memory to allocate to the task"
}

variable "task_policy_arns" {
  type        = list(string)
  description = "The Arns of the policies to attach to the task role."
}