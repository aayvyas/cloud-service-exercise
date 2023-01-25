# cloud-service-exercise

## GCP Architecture Diagram

![gcp-architecture](./static/gcp-architecture-diagram.svg)

---

## Dependencies

1. Terraform
2. GCP Cloud Account
3. Golang

## Connecting Cloud Shell to Private GKE Cluster

1. **Step 1** : Know your Cloud Shell IP using below command

   ```
   dig +short myip.opendns.com @resolver1.opendns.com
   ```

2. **Step 2** : When executing `terraform apply` command, Paste the IP in the variables.tf or Specify it while running the terraform commands

3. **Step 3** : After cluster provisioning run this to Authenticate

   ```
   gcloud container clusters get-credentials k8s-cluster \
   --project <YOUR_GCP_PROJECT_ID>
   ```
