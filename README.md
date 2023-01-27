# cloud-service-exercise

## GCP Architecture Diagram

![gcp-architecture](./static/gcp-architecture-diagram.svg)

---

## Requirements

(Must Have)

- [x] Custom VPC
- [x] GKE Standard Private Cluster
- [x] Microservice Deployed using helm
- [ ] Accessbile using a DNS (http or https)
- [ ] Unit testing
- [ ] External data source(use python script) to create firewall rules
  - [ ] Allow egress from nodes to GKE master
  - [ ] Allow all communication between nodes and pods
- [x] Setup health checks for microservices

(Should Have)

- [ ] Securing microservice using HTTPS
- [ ] Using remote terraform state
- [ ] Define restrictive network policies for micro-service namepspace - default deny ingress and egress
- [ ] Automated DNS records creation for the Service/Ingress
- [ ] Automated Certificate Provisioning for the Service/Ingress
- [ ] Setup Monitoring using Stack Drivcer
- [ ] Istio Setup

---

## Dependencies

1. Terraform : [install terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
2. GCP Cloud Account
3. Golang : [install golang](https://go.dev/doc/install)

## Connecting Cloud Shell to Private GKE Cluster

1. **Step 1** : Paste this in the CloudShell CLI to add your CloudShell's IP to authorized_cidrs in the Control Plane

   ```bash
   terraform apply -var authorized_cidr=$(dig +short myip.opendns.com @resolver1.opendns.com) -var project_id=<PROJECT_ID> -auto-approve
   ```

2. **Step 2** : Run this to Authenticate

   ```bash
   gcloud container clusters get-credentials k8s-cluster \
   --project <PROJECT_ID>
   ```

---

## Running unit tests

Paste the below command to run unit test cases in CloudShell CLI

```bash
cd ./terraform
go test ./... -v -timeout 60m
```

## Provision Infrastructure Using Terraform

On your Cloud Shell CLI, Run the below commands

```bash
terraform init
terraform validate
terraform apply -auto-approve
```

---

## Setting up Cloud Build for the pipeline

```
In Progress...
```

---

## Deploying the microservice using Helm

source: [helm](https://github.com/aayvyas/cloud-service-exercise/tree/main/helm)

Paste the below code in Cloud Shell CLI

```bash
cd ./helm
helm upgrade <GIVE_A_NAME_OF_YOUR_CHOICE> . --install
```

## Deploying using kubectl and manifests files

source: [kubernetes](https://github.com/aayvyas/cloud-service-exercise/tree/main/kubernetes)

Paste the below code in Cloud Shell CLI

```bash
cd ./kubernetes
kubectl apply -f deployment.yml
kubectl apply -f service.yml
kubectl apply -f ingress.yml
```

---

## View the deployment

To view the deployment

```bash
kubectl get ingress whereami
```

Copy the ip address shown, and paste it in the browser address bar, or Paste below command in CLI

```bash
curl <IP_ADDRESS>
```
