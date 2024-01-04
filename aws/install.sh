#!/bin/bash

# Bash script with a sequence of commands to automate IOMETE Installation.

# Variables
k8s_namespace="iomete-system"
sa_version=1.1 # service account version
karpenter_enabled=true # if you want to install Karpenter set to true (AWS only)
dp_version=1.5.0

echo "IOMETE installation started. Namespace=$k8s_namespace"
kubectl create namespace $k8s_namespace

# Service account
echo "Installing service account. Version=$sa_version"
helm upgrade --install -n $k8s_namespace lakehouse-sa iomete/iomete-lakehouse-service-account --version $sa_version  -f files/lakehouse-service-account-values.yaml

# Helm repo
kubectl apply -n $k8s_namespace -f files/iomete-helm-repo.yaml

# Istio
echo "Installing Istio"
kubectl apply -n $k8s_namespace -f files/istio.yaml
sleep 10

# Karpenter
if [ "$karpenter_enabled" = true ] ; then
    echo "Installing Karpenter"
    kubectl create namespace karpenter
    kubectl apply -n karpenter -f karpenter.yaml
    kubectl apply -n karpenter -f karpenter-provisioners.yaml
fi

# Database setup
echo "Installing MySQL database"
helm upgrade --install -n $k8s_namespace -f files/mysql-values.yaml mysql bitnami/mysql
sleep 20

# Install Data-Plane
echo "Installing Data-Plane"
helm upgrade --install -n $k8s_namespace iomete-dataplane iomete/iomete-dataplane-community -f files/data-plane-values.yaml --version $dp_version

echo "IOMETE installation completed. Please configure your DNS to point to the LoadBalancer IP."
