package tests

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)


func TestVpcSubentFirewall(t *testing.T){

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../examples/example-terraform-vpc",
		Vars:  map[string]interface{} {
			"vpc_description" : "vpc created using module written by aayvyas",
        },
	})
	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	t.Run("VPC has the specified description", func(t *testing.T){
		output := terraform.Output(t, terraformOptions, "vpc_description")
		assert.Equal(t, "vpc created using module written by aayvyas", output)
	})

	t.Run("VPC has routing mode as REGIONAL", func(t *testing.T){
		output := terraform.Output(t, terraformOptions, "vpc_routing_mode")
		assert.Equal(t, "REGIONAL", output)
	})

	t.Run("Specified number of subnets are created", func(t *testing.T){
		output:= terraform.Output(t, terraformOptions, "subnet_count" )
		assert.Equal(t, "2", output)
	})
}

