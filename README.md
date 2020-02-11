# Example Java application in Docker

## Local environment

Run application in docker-compose:

```bash
./application/run.sh
```

Publish application images to docker registry:

```bash
./application/publish.sh
```

## Production environment

### Prerequisites

To usethis example you need to have installed and configured: AWS CLI tools, terraform, kubectl.

### Deploy application to Kubernetes cluster

Deploy all infrastructure tiers:

```bash
./deployment/infrastructure/deploy.sh foundation
./deployment/infrastructure/deploy.sh application
./deployment/infrastructure/deploy.sh database
```

Get K8s config file to manage EKS cluster:

```bash
aws --region eu-central-1 --profile usatellite-terraform eks update-kubeconfig --name workshop
```

Deploy the application

```bash
kubectl apply -f ./deployment/kubernetes
```
