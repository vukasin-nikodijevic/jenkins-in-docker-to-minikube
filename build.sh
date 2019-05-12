#!/bin/bash 

set -e

mkdir -p .minikube .kube

# config requied from kubectl
cp -f "${HOME}"/.kube/config .kube/config

# copy all certificates we need from minikube
cp -f "${HOME}"/.minikube/*.{pem,key,crt} .minikube

docker build \
-t development/jenkins:latest \
--build-arg HOST_HOME_DIR="${HOME}" \
. 