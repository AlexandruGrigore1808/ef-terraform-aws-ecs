locals {
  account_name = data.aws_iam_account_alias.current.account_alias
  account_name_components = split("-", local.account_name)
  account_environment = element(local.account_name_components, 2)

  account_mapping = {

    # Dev 
    "dev" = {
      environment = "DEV"
    }

    # Test 
    "test" = {
      environment = "TEST"
    }
  }

  tags = map(
    "ApplicationName", "EF-App-Name",
    "Environment", lookup(local.account_mapping[local.account_environment], "environment"),
    "Owner", "AG",
    "Region", "eu-central-1",
  )

  service_boundary = format("arn:aws:iam::%s:policy/ServiceRoleBoundary", data.aws_caller_identity.current.account_id)

  task_policy = {
    task_ecs_policy = {
      description = "TerratestTaskEcsPolicy"
      name        = "TaskEcsPolicy"
      path        = "/"
      policy      = data.aws_iam_policy_document.terratest_s3_policy.json
    }
  }

  container_definition = <<EOF
[
  { 
      "command": [
        "/bin/sh -c \"echo 'hi'\""
      ],
      "entryPoint": [
        "sh",
        "-c"
      ],
      "essential": true,
      "image": "httpd:2.4",
      "logConfiguration": { 
        "logDriver": "awslogs",
        "options": { 
            "awslogs-group" : "/ecs/fargate-task-definition",
            "awslogs-region": "eu-central-1",
            "awslogs-stream-prefix": "ecs"
        }
      },
      "name": "sample-fargate-app",
      "memory": 512
  }
]
EOF
}