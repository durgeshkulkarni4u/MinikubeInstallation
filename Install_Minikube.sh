#!/bin/bash

LOG_FILE="Minikube_"$(date '+%Y%m%d%H%M%S')".log"

# Close STDOUT file descriptor
exec 1<&-
# Close STDERR FD
exec 2<&-

# Open STDOUT as $LOG_FILE file for read and write.
exec 1<>$LOG_FILE

# Redirect STDERR to STDOUT
exec 2>&1

printf "[INFO] Starting Minikube Installation.."

printf ""

printf "[INFO] Downloading Kubectl.."
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl && sudo mv ./kubectl /usr/local/bin/kubectl

printf ""

printf "[INFO] Installing Docker.."
sudo apt-get update && sudo apt-get install docker.io -y

printf ""

printf "[INFO] Installing Minikube.."
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube && sudo mv minikube /usr/local/bin/

printf ""
#If conntrack is not installed you get the error - "Kubernetes v1.18.0 requires conntrack to be installed in root's path"

printf "[INFO] Installing conntrack.."
sudo apt update && sudo apt install conntrack -y

printf ""

printf "[INFO] Starting Docker and Kubectl.."
sudo systemctl enable docker.service
sudo systemctl enable kubelet.service
printf ""
printf "[INFO] Docker and Kubectl restarted.."
