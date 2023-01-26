package tests

import (
	"regexp"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)


func TestGKE(t *testing.T){

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../examples/example-terraform-gke-standard-private-cluster",
		Vars:  map[string]interface{} {
			"project_id" : "burner-aayvyas",
			"dont_enable_public_endpoint" : false,
        },
	})
	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	t.Run("public endpoint is generated", func(t *testing.T){
		output := terraform.Output(t, terraformOptions, "public_endpoint")
		re := regexp.MustCompile(`(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}`)
		assert.Regexp(t, re, output)
	})
}

