SHELL := /bin/sh
export AWS_DEFAULT_REGION="eu-central-1"
export AWS_SDK_LOAD_CONFIG="true"
moduleName := `basename "$(PWD)" | tr 'a-z' 'A-Z'`

all: terraform-fmt terraform-vld terratest-go terraform-docs

terraform-fmt:
	@echo ""
	@echo "Performing a Terraform format"
	terraform fmt -recursive

terraform-vld:
	@echo ""
	@echo "Performing a Terraform Validate on Root Module"
	terraform init -backend=false
	terraform validate

	@echo ""
	@echo "Performing a Terraform Validate on the IAM Assume Role Test"
	terraform init -backend=false tests/tf_iam_assume_role
	terraform validate tests/tf_iam_assume_role

	@echo ""
	@echo "Performing a Terraform Validate on the IAM Instance Profile Test"
	terraform init -backend=false tests/tf_iam_instance_profile
	terraform validate tests/tf_iam_instance_profile

	@echo ""
	@echo "Performing a Terraform Validate on the IAM Policy Test"
	terraform init -backend=false tests/tf_iam_policy
	terraform validate tests/tf_iam_policy

terratest-go:
	@echo ""
	@echo "Running Terratest VPC Endpoint Service"
	@echo ""
	go test -v tests/iam_assume_role_test.go

terraform-docs:
	@echo ""
	@echo "Updating Terraform Module Documentation"
	@echo ""
	printf "# $(moduleName)" > README.md
	printf "\n\n## hcl .tfvars file format" >> README.md
	printf '\n\n```\n' >> README.md
	printf "$$(terraform-docs tfvars hcl .)" >> README.md
	printf '\n```' >> README.md

	@echo ""
	@echo "Updating IAM Assume Role Terraform Sub Module Documentation"
	@echo ""
	printf "$$(terraform-docs markdown iam_assume_role)" > iam_assume_role/README.md
	printf "\n\n## hcl .tfvars file format" >> iam_assume_role/README.md
	printf '\n\n```\n' >> iam_assume_role/README.md
	printf "$$(terraform-docs tfvars hcl iam_assume_role)" >> iam_assume_role/README.md
	printf '\n```' >> iam_assume_role/README.md

	@echo ""
	@echo "Updating IAM Instance Profile Terraform Sub Module Documentation"
	@echo ""
	printf "$$(terraform-docs markdown iam_instance_profile)" > iam_instance_profile/README.md
	printf "\n\n## hcl .tfvars file format" >> iam_instance_profile/README.md
	printf '\n\n```\n' >> iam_instance_profile/README.md
	printf "$$(terraform-docs tfvars hcl iam_instance_profile)" >> iam_instance_profile/README.md
	printf '\n```' >> iam_instance_profile/README.md

	@echo ""
	@echo "Updating IAM Policy Terraform Sub Module Documentation"
	@echo ""
	printf "$$(terraform-docs markdown iam_policy)" > iam_policy/README.md
	printf "\n\n## hcl .tfvars file format" >> iam_policy/README.md
	printf '\n\n```\n' >> iam_policy/README.md
	printf "$$(terraform-docs tfvars hcl iam_policy)" >> iam_policy/README.md
	printf '\n```' >> iam_policy/README.md

	@echo ""
	@echo "Updating IAM Assume Role Test Terraform Configuration Documentation"
	@echo ""
	printf "$$(terraform-docs markdown tests/tf_iam_assume_role)" > tests/tf_iam_assume_role/README.md
	printf "\n\n## hcl .tfvars file format" >> tests/tf_iam_assume_role/README.md
	printf '\n\n```\n' >> tests/tf_iam_assume_role/README.md
	printf "$$(terraform-docs tfvars hcl tests/tf_iam_assume_role)" >> tests/tf_iam_assume_role/README.md
	printf '\n```' >> tests/tf_iam_assume_role/README.md

	@echo ""
	@echo "Updating IAM Instance Profile Test Terraform Configuration Documentation"
	@echo ""
	printf "$$(terraform-docs markdown tests/tf_iam_instance_profile)" > tests/tf_iam_instance_profile/README.md
	printf "\n\n## hcl .tfvars file format" >> tests/tf_iam_instance_profile/README.md
	printf '\n\n```\n' >> tests/tf_iam_instance_profile/README.md
	printf "$$(terraform-docs tfvars hcl tests/tf_iam_instance_profile)" >> tests/tf_iam_instance_profile/README.md
	printf '\n```' >> tests/tf_iam_instance_profile/README.md

	@echo ""
	@echo "Updating IAM Policy Test Terraform Configuration Documentation"
	@echo ""
	printf "$$(terraform-docs markdown tests/tf_iam_policy)" > tests/tf_iam_policy/README.md
	printf "\n\n## hcl .tfvars file format" >> tests/tf_iam_policy/README.md
	printf '\n\n```\n' >> tests/tf_iam_policy/README.md
	printf "$$(terraform-docs tfvars hcl tests/tf_iam_policy)" >> tests/tf_iam_policy/README.md
	printf '\n```' >> tests/tf_iam_policy/README.md