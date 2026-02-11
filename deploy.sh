#!/bin/bash

echo "Applying Redis PVC..."
kubectl apply -f pvc.yaml

echo "Applying Redis Deployment..."
kubectl apply -f deployment.yaml

echo "Applying Redis Service..."
kubectl apply -f service.yaml

echo "Waiting for Redis pod to be ready..."
kubectl wait --for=condition=ready pod -l app=redis --timeout=60s

echo "Starting port-forward : 6379 -> Redis service"
echo "Use Ctrl+C to stop forwarding"

kubectl port-forward svc/redis 6379:6379
