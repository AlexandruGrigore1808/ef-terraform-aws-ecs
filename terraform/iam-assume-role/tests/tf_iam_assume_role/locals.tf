locals {
  account_name = data.aws_iam_account_alias.current.account_alias
  account_name_components = split("-", local.account_name)
  account_environment = element(local.account_name_components, 2)

  account_mapping = {

    # DEV account
    "dev" = {
      environment = "DEV"
    }

    # TEST account
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
}