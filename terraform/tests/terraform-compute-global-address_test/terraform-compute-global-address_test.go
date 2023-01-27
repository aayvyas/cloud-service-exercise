package tests

import (
	"regexp"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)


func TestComputeAddress(t *testing.T){

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../examples/example-terraform-compute-global-address",
		Vars:  map[string]interface{} {
			"project_id" : "burner-aayvyas",
        },
	})
	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
	t.Run("public static ip address is genereated", func(t *testing.T){
		output := terraform.Output(t, terraformOptions, "static_ip_address")
		re := regexp.MustCompile(`(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}`)
		assert.Regexp(t, re, output)
	})
}

