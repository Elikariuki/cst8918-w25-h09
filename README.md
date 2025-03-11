# Deploying the Sample Application on Azure Kubernetes Service

## Overview

This guide provides step-by-step instructions to deploy a sample application on an Azure Kubernetes Service (AKS) cluster using Terraform and kubectl.

## Prerequisites

Ensure you have the following installed:

1. Terraform
2. Azure CLI
3. kubectl

Step 1: Authenticate to Azure

Login to your Azure account:

```shell
az login
```

(Optional) Set your desired subscription:

```shell
az account set --subscription "<your-subscription-id>"
```

Step 2: Clone the Repository

Clone the repository containing the Terraform configurations and Kubernetes manifests:

```shell
git clone <repository-url>
cd aks-terraform
```

### Step 3: Deploy the AKS Cluster

Initialize Terraform:

```shell
terraform init
```

Validate the configuration:

```shell
terraform validate
```

Deploy the resources:

```shell
terraform apply -auto-approve
```

Retrieve the kubeconfig file:

```shell
echo "$(terraform output kube_config)" > ./kubeconfig
export KUBECONFIG=./kubeconfig
```

Verify cluster access:

```shell
kubectl get nodes
```

### Step 4: Deploy the Sample Application

Apply the Kubernetes manifests:
```shell
kubectl apply -f sample-app.yaml
```
Verify that the pods and services are running:

```shell
kubectl get pods
kubectl get services
```

### Step 5: Access the Application

Retrieve the external IP address of the store-front service:
```shell
kubectl get service store-front
```

Copy the external IP and open it in a browser:
```url
http://<EXTERNAL_IP>
```

### Step 6: Cleanup (Optional)

To destroy all deployed resources:
```shell
terraform destroy -auto-approve
```
## Troubleshooting

If kubectl commands fail, check if the KUBECONFIG variable is set correctly.

If the external IP is not available, wait a few minutes and re-run:

```shell
kubectl get services
```


