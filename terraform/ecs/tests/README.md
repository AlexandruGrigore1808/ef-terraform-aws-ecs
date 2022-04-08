How to run Terratest
* Install golang
* Install dependencies:
   * `go get github.com/aws/aws-sdk-go/aws/...`
   * `go get github.com/aws/aws-sdk-go/aws/awserr/...`
   * `go get github.com/aws/aws-sdk-go/aws/session/...`
   * `go get "github.com/aws/aws-sdk-go/service/iam"/...`
   * `go get github.com/gruntwork-io/terratest/modules/random/...`
   * `go get github.com/gruntwork-io/terratest/modules/terraform/...`
   * `go get github.com/stretchr/testify/assert/..`
        * The three dots at the end means to install the module's dependencies too```

* Run tests:
    * Run go test -v tests/ecs_test.go

**N.b. The Makefile will install golang dependencies and execute the above mentioned tests.**