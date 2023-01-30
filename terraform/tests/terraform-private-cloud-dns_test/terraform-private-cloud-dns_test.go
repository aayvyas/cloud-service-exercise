package tests

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)


func TestPrivateCloudDNS(t *testing.T){

	dns_name := "cloudservices.com."
	subdomain_name := "api"
	ip_address_for_dns := "12.12.12.12"

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../examples/example-terraform-private-cloud-dns",
		Vars:  map[string]interface{} {
			"project_id" : "burner-aayvyas",
			"dns_name" : dns_name,
			"subdomain_name" : subdomain_name,
			"ip_address_for_dns" : ip_address_for_dns,
			
        },
	})
	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	t.Run("specified dns name is configured", func(t *testing.T){
		output := terraform.Output(t, terraformOptions, "dns_name")
		assert.Equal(t, dns_name , output)
	})


	// the dns is private
	t.Run("dns visibility is private", func(t *testing.T){
		output := terraform.Output(t, terraformOptions, "is_private")
		assert.Equal(t, "private" , output)
	})
	
	t.Run("A DNS record is created with specified subdomain", func(t *testing.T){
		output := terraform.Output(t, terraformOptions, "subdomain_name")
		assert.Equal(t, subdomain_name+"."+dns_name , output)
	})
}



