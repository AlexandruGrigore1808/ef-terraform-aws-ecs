## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| ecs | ../../ |  |

## Resources

| Name |
|------|
| [aws_caller_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) |
| [aws_iam_account_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_account_alias) |
| [aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) |

## Inputs

No input.

## Outputs

| Name | Description |
|------|-------------|
| cluster\_arn | The ARN of the ECS a cluster |
| cluster\_name | The name of the ECS cluster |
| service\_name | Name of the ECS service |
| task\_definition | The ARN of the task definition for the ECS task |

## hcl .tfvars file format

```

```