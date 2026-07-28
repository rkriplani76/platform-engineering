# Single-node AKS learning cluster with Terraform

This folder contains a minimal Terraform configuration to create a single-node Azure Kubernetes Service (AKS) cluster for learning purposes.

## Prerequisites

- Azure CLI installed and signed in
- Terraform installed
- An SSH public key available at `~/.ssh/id_rsa.pub`

## Authentication

Run:

```bash
az login
az account set --subscription "<your-subscription-id>"
```

## Configure Terraform variables

Populate the SSH key value before applying:

```bash
export TF_VAR_ssh_public_key="$(cat ~/.ssh/id_rsa.pub)"
```

On PowerShell:

```powershell
$env:TF_VAR_ssh_public_key = Get-Content ~/.ssh/id_rsa.pub
```

## Deploy

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

## Connect to the cluster

```bash
az aks get-credentials --resource-group rg-aks-learn --name aks-learn
kubectl get nodes
```

## Destroy

```bash
terraform destroy -auto-approve
```
