package tests

import (
	"regexp"
	"strconv"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)


func TestGKE(t *testing.T){


	authorized_cidr := "32.32.32.32"
	is_premptible := true
	machine_type := "e2-micro"
	node_count := 2

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../examples/example-terraform-gke-standard-private-cluster",
		Vars:  map[string]interface{} {
			"project_id" : "burner-aayvyas",
			"dont_enable_public_endpoint" : false,
			"authorized_cidr" : authorized_cidr,
			"is_premptible" : is_premptible,
			"machine_type" : machine_type,
			"node_count" : 2, 
        },
	})
	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	t.Run("public endpoint is generated", func(t *testing.T){
		output := terraform.Output(t, terraformOptions, "public_endpoint")
		re := regexp.MustCompile(`(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}`)
		assert.Regexp(t, re, output)
	})
	t.Run("premtibility is configured", func(t *testing.T){
		output := terraform.Output(t, terraformOptions, "is_premptible")
		assert.Equal(t, strconv.FormatBool(is_premptible), output)
	})
	t.Run("machine type is configured properly", func(t *testing.T){
		output := terraform.Output(t, terraformOptions, "machine_type")
		assert.Equal(t,machine_type, output)
	})
	t.Run("Specified node count is configured and created in the node pool", func(t *testing.T){
		output := terraform.Output(t, terraformOptions, "node_count")
		assert.Equal(t, strconv.Itoa(node_count), output)
	})

}

