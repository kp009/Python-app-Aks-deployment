# Python AKS Deployment

This application demonstrates deploying a Python Flask app to Azure Kubernetes Service.

## Prerequisites
- Azure CLI
- Docker
- kubectl

## Deployment Steps

1. Build and push Docker image:
```bash
az acr build --registry <acr-name> --image python-app:latest .
Deploy to AKS:

bash
kubectl apply -f deployment.yaml
Get external IP:

bash
kubectl get service python-app-service
