#!/bin/bash

echo "Creating persistent volume for redis..."

kubectl apply -f ./kubernetes/redis-persistent-volume.yml
kubectl apply -f ./kubernetes/redis-persistent-volume-claim.yml

echo "Creating redis deployment and service..."

kubectl delete -n default deployment redis
kubectl create -f ./kubernetes/redis-deployment.yml
kubectl delete -n default service redis
kubectl create -f ./kubernetes/redis-service.yml

echo "Creating the my-fastapi deployment and service..."

kubectl delete -n default deployment my-fastapi
kubectl create -f ./kubernetes/my-fastapi-deployment.yml
kubectl delete -n default service my-fastapi
kubectl create -f ./kubernetes/my-fastapi-service.yml

echo "Adding the ingress..."

minikube addons enable ingress
kubectl apply -f ./kubernetes/minikube-ingress.yml


# echo "Creating the vue-frontend deployment and service..."

# kubectl delete -n default deployment vue-frontend
# kubectl create -f ./kubernetes/vue-frontend-deployment.yml
# kubectl delete -n default service vue-frontend
# kubectl create -f ./kubernetes/vue-frontend-service.yml