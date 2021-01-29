#!/bin/bash

echo "Creating the my-fastapi deployment and service..."

kubectl delete -n default deployment my-fastapi
kubectl create -f ./kubernetes/my-fastapi-deployment.yml
kubectl delete -n default service my-fastapi
kubectl create -f ./kubernetes/my-fastapi-service.yml

echo "Adding the ingress..."

minikube addons enable ingress
kubectl apply -f ./kubernetes/minikube-ingress.yml
