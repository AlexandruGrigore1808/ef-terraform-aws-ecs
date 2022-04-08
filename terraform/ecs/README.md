# ECS

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| execution_role |  |  |
| task_role |  |  |

## Resources

| Name |
|------|
| [aws_ecs_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) |
| [aws_ecs_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) |
| [aws_ecs_task_definition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_name | Name for the ECS Cluster | `string` | n/a | yes |
| container\_definitions | The JSON representation of the container definition | `string` | n/a | yes |
| cpu | (Optional) The number of cpu units used by the task. If the requires\_capabilities is FARGATE this field is required. | `string` | n/a | yes |
| deployment\_controller\_type | (Optional) Type of deployment controller. Valid values: CODE\_DEPLOY, ECS, EXTERNAL. Default: ECS. | `string` | `"ECS"` | no |
| deployment\_maximum\_percent | (Optional) The upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment. Not valid when using the DAEMON scheduling strategy. | `string` | `null` | no |
| deployment\_minimum\_healthy\_percent | (Optional) The lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment. | `string` | `null` | no |
| desired\_count | (Optional) The number of instances of the task definition to place and keep running. Defaults to 0. Do not specify if using the DAEMON scheduling strategy. | `string` | `null` | no |
| enable\_ecs\_managed\_tags | (Optional) Specifies whether to enable Amazon ECS managed tags for the tasks within the service. | `bool` | `null` | no |
| execution\_assume\_role\_policy | Assume role policy for the execution IAM Role, provide as the JSON output of a policy data resource. | `string` | n/a | yes |
| execution\_role\_name | Role name for the created IAM role used for the ECS execution | `string` | n/a | yes |
| execution\_service\_boundary | Service boundary for the execution iam role. | `string` | `null` | no |
| force\_new\_deployment | (Optional) Enable to force a new task deployment of the service. This can be used to update tasks to use a newer Docker image with same image/tag combination (e.g. myimage:latest), roll Fargate tasks onto a newer platform version, or immediately deploy ordered\_placement\_strategy and placement\_constraints updates. | `bool` | `null` | no |
| ipc\_mode | (Optional) The IPC resource namespace to be used for the containers in the task The valid values are host, task, and none. | `string` | `null` | no |
| is\_container\_insights\_enabled | (Optional) Whether or not container insights are enabled. Valid values are enabled and disabled. | `string` | `null` | no |
| launch\_type | (Optional) The launch type on which to run your service. The valid values are EC2 and FARGATE. Defaults to EC2. | `string` | `null` | no |
| memory | How much memory to allocate to the task | `string` | n/a | yes |
| network\_configuration | (Optional) The network configuration for the service. This parameter is required for task definitions that use the awsvpc network mode to receive their own Elastic Network Interface, and it is not supported for other network modes. | <pre>object(<br>    {<br>      subnets          = list(string)<br>      security_groups  = list(string)<br>      assign_public_ip = bool<br>    }<br>  )</pre> | `null` | no |
| network\_mode | (Optional) The Docker networking mode to use for the containers in the task. The valid values are none, bridge, awsvpc, and host. | `string` | `null` | no |
| pid\_mode | (Optional) The process namespace to use for the containers in the task. The valid values are host and task. | `string` | `null` | no |
| platform\_version | (Optional) The platform version on which to run your service. Only applicable for launch\_type set to FARGATE. Defaults to LATEST. More information about Fargate platform versions can be found in the AWS ECS User Guide. | `string` | `null` | no |
| propagate\_tags | (Optional) Specifies whether to propagate the tags from the task definition or the service to the tasks. The valid values are SERVICE and TASK\_DEFINITION. | `string` | `null` | no |
| requires\_compatibilities | (Optional) A set of launch types required  by the task. The valid values are EC2 and FARGATE. | `list(string)` | n/a | yes |
| scheduling\_strategy | (Optional) The scheduling strategy to use for the service. The valid values are REPLICA and DAEMON. Defaults to REPLICA. Note that Tasks using the Fargate launch type or the CODE\_DEPLOY or EXTERNAL deployment controller types don't support the DAEMON scheduling strategy. | `string` | `null` | no |
| service\_name | The name of the ECS Service. | `string` | n/a | yes |
| tags | tags | `map(string)` | n/a | yes |
| task\_assume\_role\_policy | Assume role policy for the task IAM Role, provide as the JSON output of a policy data resource. | `string` | n/a | yes |
| task\_definition\_family | Unique name for your task definition. | `string` | n/a | yes |
| task\_policy\_arns | The Arns of the policies to attach to the task role. | `list(string)` | n/a | yes |
| task\_policy\_map | Policy map for the task policy. | <pre>map(object({<br>    description = string<br>    name        = string<br>    path        = string<br>    policy      = string<br>  }))</pre> | n/a | yes |
| task\_role\_name | Role name for the created IAM role used for the ECS Task | `string` | n/a | yes |
| task\_service\_boundary | Service boundary for the task iam role. | `string` | `null` | no |
| wait\_for\_steady\_state | (Optional) If true, Terraform will wait for the service to reach a steady state (like aws ecs wait services-stable) before continuing. Default false | `bool` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_arn | The ARN of the ECS a cluster |
| cluster\_name | The name of the ECS cluster |
| service\_name | Name of the ECS service |
| task\_definition | The ARN of the task definition for the ECS task |

## hcl .tfvars file format

```
cluster_name                       = ""
container_definitions              = ""
cpu                                = ""
deployment_controller_type         = "ECS"
deployment_maximum_percent         = ""
deployment_minimum_healthy_percent = ""
desired_count                      = ""
enable_ecs_managed_tags            = ""
execution_assume_role_policy       = ""
execution_role_name                = ""
execution_service_boundary         = ""
force_new_deployment               = ""
ipc_mode                           = ""
is_container_insights_enabled      = ""
launch_type                        = ""
memory                             = ""
network_configuration              = ""
network_mode                       = ""
pid_mode                           = ""
platform_version                   = ""
propagate_tags                     = ""
requires_compatibilities           = ""
scheduling_strategy                = ""
service_name                       = ""
tags                               = ""
task_assume_role_policy            = ""
task_definition_family             = ""
task_policy_arns                   = ""
task_policy_map                    = ""
task_role_name                     = ""
task_service_boundary              = ""
wait_for_steady_state              = ""
```