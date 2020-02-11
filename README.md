# Example Java application in Docker

## Prerequisites

To usethis example you need:

- installed and configured AWS CLI tools
- installed terraform
- installed kubectl tool

## Deploy application using Kubernetes

Deploy all infrastructure tiers:

```bash
./infrastructure/deploy.sh foundation \
  && ./infrastructure/deploy.sh application \
  && ./infrastructure/deploy.sh database
```

Get K8s config file to manage EKS cluster:

```bash
aws --region eu-central-1 eks update-kubeconfig --name workshop
```

Remove infrastructure:

```bash
cd ./infrastructure/
```
