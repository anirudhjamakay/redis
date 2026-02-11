#!/bin/bash

echo "Deleting Redis deployment..."
kubectl delete -f deployment.yaml

echo "Deleting Redis service..."
kubectl delete -f service.yaml

echo "Deleting Redis PVC..."
kubectl delete -f pvc.yaml

echo "Done!"
