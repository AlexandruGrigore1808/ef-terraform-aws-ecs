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
	@echo "Performing a Terraform Validate"
	terraform init -backend=false
	terraform validate

terratest-go:
	@echo ""
	@echo "Running Terratest Test"
	go test -v tests/ecs_test.go

terraform-docs:
	@echo ""
	@echo "Updating Terraform Module Documentation"
	@echo ""
	printf "# $(moduleName)(terraform-docs markdown .)" > README.md
	printf "\n\n## hcl .tfvars file format" >> README.md
	printf '\n\n```\n' >> README.md
	printf "$$(terraform-docs tfvars hcl .)" >> README.md
	printf '\n```' >> README.md

	@echo ""
	@echo "Updating Test Terraform Configuration Documentation"
	@echo ""
	printf "$$(terraform-docs markdown tests/tf_ecs)" > tests/tf_ecs/README.md
	printf "\n\n## hcl .tfvars file format" >> tests/tf_ecs/README.md
	printf '\n\n```\n' >> tests/tf_ecs/README.md
	printf "$$(terraform-docs tfvars hcl tests/tf_ecs)" >> tests/tf_ecs/README.md
	printf '\n```' >> tests/tf_ecs/README.md