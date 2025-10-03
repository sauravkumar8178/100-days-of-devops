#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e

# Day 49: Deploy Applications with Kubernetes Deployments

echo "Creating nginx deployment in Kubernetes..."

# Create nginx deployment
kubectl create deployment nginx --image=nginx:latest

# Verify the deployment
echo "Verifying deployment..."
kubectl get deployments

# Check pods created by deployment
echo "Checking pods..."
kubectl get pods

echo "nginx deployment completed successfully!"

# Make it executable and run it
chmod +x nginx-deployment.sh
./nginx-deployment.sh
