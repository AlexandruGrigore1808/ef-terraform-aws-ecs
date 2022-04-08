package test

import (
	"fmt"
	"testing"
	"os"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/awserr"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/iam"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// A function to test the Terraform module with Iam Assume Role using Terratest.
func TestTerraformIamAssumeRole(t *testing.T) {
	t.Parallel()

	// Provide iam role a unique ID for a name.
	iamRoleName := fmt.Sprintf("terratest-iam-role-%s", random.UniqueId())

	// AWS region to test in.
	awsRegion := "eu-central-1"

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "tf_iam_assume_role/",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"role_name": iamRoleName,
		},

		// Environment variables to set when running Terraform
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": awsRegion,
			"AWS_ACCESS_KEY_ID": os.Getenv("AWS_ACCESS_KEY_ID"),
			"AWS_SECRET_ACCESS_KEY": os.Getenv("AWS_SECRET_ACCESS_KEY"),
			"AWS_SESSION_TOKEN": os.Getenv("AWS_SESSION_TOKEN"),
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Look up the IAM Role Name from output.
	IamRoleNameOutput := terraform.Output(t, terraformOptions, "role_name")

	// Query AWS API for IAM Role Name and assert Equal.
	IamRoleQuery := GetIamRoleName(IamRoleNameOutput, awsRegion)

	assert.Equal(t, IamRoleNameOutput, IamRoleQuery)
}

// A function to test the Terraform module with Iam Assume Role and Instance Profile using Terratest.
func TestTerraformIamInstanceProfile(t *testing.T) {
	t.Parallel()

	// Provide iam role a unique ID for a name.
	iamRoleInstancePrfileName := fmt.Sprintf("terratest-iam-instance-profile-role-%s", random.UniqueId())

	// Provide iam instance profile a unique ID for a name.
	instanceProfileName := fmt.Sprintf("terratest-instance-profile-%s", random.UniqueId())

	// AWS region to test in.
	awsRegion := "eu-central-1"

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "tf_iam_instance_profile/",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"role_name": iamRoleInstancePrfileName,
			"instance_profile_name": instanceProfileName,
		},

		// Environment variables to set when running Terraform
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": awsRegion,
			"AWS_ACCESS_KEY_ID": os.Getenv("AWS_ACCESS_KEY_ID"),
			"AWS_SECRET_ACCESS_KEY": os.Getenv("AWS_SECRET_ACCESS_KEY"),
			"AWS_SESSION_TOKEN": os.Getenv("AWS_SESSION_TOKEN"),
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Look up Terraform outputs.
	IamRoleNameOutput := terraform.Output(t, terraformOptions, "role_name")
	IamInstanceProfileNameOutput := terraform.Output(t, terraformOptions, "profile_name")

	// Query AWS API for IAM Role Name and assert Equal.
	IamRoleQuery := GetIamRoleName(IamRoleNameOutput, awsRegion)

	assert.Equal(t, IamRoleNameOutput, IamRoleQuery)

	// Query AWS API for IAM Instance Profile Name and assert Equal.
	IamInstanceProfileQuery := GetIamInstanceProfileName(IamInstanceProfileNameOutput, awsRegion)

	assert.Equal(t, IamInstanceProfileNameOutput, IamInstanceProfileQuery)
}

// // A function to test the Terraform module with Iam Assume Role and Iam Policies using Terratest.
func TestTerraformIamPolicy(t *testing.T) {
	t.Parallel()

	// Provide iam role a unique ID for a name.
	iamPolicyRoleName := fmt.Sprintf("terratest-iam-policy-role-%s", random.UniqueId())

	// Provide iam policy a unique ID for a name.
	s3PolicyName := fmt.Sprintf("terratest-s3-iam-policy-%s", random.UniqueId())

	// Provide iam policy a unique ID for a name.
	ec2PolicyName := fmt.Sprintf("terratest-ec2-iam-policy-%s", random.UniqueId())

	// AWS region to test in.
	awsRegion := "eu-central-1"

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "tf_iam_policy/",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"role_name": iamPolicyRoleName,
			"terratest_s3_policy_name": s3PolicyName,
			"terratest_ec2_policy_name": ec2PolicyName,
		},

		// Environment variables to set when running Terraform
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": awsRegion,
			"AWS_ACCESS_KEY_ID": os.Getenv("AWS_ACCESS_KEY_ID"),
			"AWS_SECRET_ACCESS_KEY": os.Getenv("AWS_SECRET_ACCESS_KEY"),
			"AWS_SESSION_TOKEN": os.Getenv("AWS_SESSION_TOKEN"),
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Look up Terraform outputs.
	IamRoleNameOutput := terraform.Output(t, terraformOptions, "role_name")
	IamPolicyNameOutput := terraform.OutputList(t, terraformOptions, "policy_name")
	IamPolicyArnOutput := terraform.OutputList(t, terraformOptions, "policy_arn")

	// Query AWS API for IAM Role Name and assert Equal.
	IamRoleQuery := GetIamRoleName(IamRoleNameOutput, awsRegion)

	assert.Equal(t, IamRoleNameOutput, IamRoleQuery)

	// Query AWS API for IAM Policy Name and assert Equal.
	IamPolicyQuery := GetIamPolicyName(IamPolicyArnOutput[0], awsRegion)

	assert.Equal(t, IamPolicyNameOutput[0], IamPolicyQuery)
}

// A function to query the AWS API to validate that the IAM Role has been deployed.
func GetIamRoleName(IamRoleName, awsRegion string)(string) {
	// Initialize a session in us-west-2 that the SDK will use to load
    // credentials from the shared credentials file ~/.aws/credentials.
	sess, err := session.NewSession(&aws.Config{
		Region: aws.String(awsRegion)},
	)

	// Create an IAM service client.
	svc := iam.New(sess)

	// Declare the filters for the IAM Role.
	input := &iam.GetRoleInput{
		RoleName: aws.String(IamRoleName),
	}

	// Retrieve the IAM Role.
	result, err := svc.GetRole(input)

	if err != nil {
		if aerr, ok := err.(awserr.Error); ok {
			switch aerr.Code() {
			default:
				fmt.Println(aerr.Error())
			}
		} else {
			// Print the error, cast err to awserr.Error to get the Code and
			// Message from an error.
			fmt.Println(err.Error())
		}
		os.Exit(1)
	}

	return *result.Role.RoleName
}

// A function to query the AWS API to validate that the Instance Profile has been deployed.
func GetIamInstanceProfileName(InstanceProfileName, awsRegion string)(string) {
	// Initialize a session in us-west-2 that the SDK will use to load
    // credentials from the shared credentials file ~/.aws/credentials.
	sess, err := session.NewSession(&aws.Config{
		Region: aws.String(awsRegion)},
	)

	// Create an IAM service client.
	svc := iam.New(sess)

	// Declare the filters for the IAM Instance Profile.
	input := &iam.GetInstanceProfileInput{
		InstanceProfileName: aws.String(InstanceProfileName),
	}

	// Retrieve the IAM Instance Profile.
	result, err := svc.GetInstanceProfile(input)

	if err != nil {
		if aerr, ok := err.(awserr.Error); ok {
			switch aerr.Code() {
			default:
				fmt.Println(aerr.Error())
			}
		} else {
			// Print the error, cast err to awserr.Error to get the Code and
			// Message from an error.
			fmt.Println(err.Error())
		}
		os.Exit(1)
	}

	return *result.InstanceProfile.InstanceProfileName
}

// A function to query the AWS API to validate that the IAM Policy has been deployed.
func GetIamPolicyName(IamPolicyArn, awsRegion string)(string) {
	// Initialize a session in us-west-2 that the SDK will use to load
    // credentials from the shared credentials file ~/.aws/credentials.
	sess, err := session.NewSession(&aws.Config{
		Region: aws.String(awsRegion)},
	)

	// Create an IAM service client.
	svc := iam.New(sess)

	// Declare the filters for the IAM Policy.
	input := &iam.GetPolicyInput{
		PolicyArn: aws.String(IamPolicyArn),
	}

	// Retrieve the IAM Policy.
	result, err := svc.GetPolicy(input)

	if err != nil {
		if aerr, ok := err.(awserr.Error); ok {
			switch aerr.Code() {
			default:
				fmt.Println(aerr.Error())
			}
		} else {
			// Print the error, cast err to awserr.Error to get the Code and
			// Message from an error.
			fmt.Println(err.Error())
		}
		os.Exit(1)
	}

	return *result.Policy.PolicyName
}
