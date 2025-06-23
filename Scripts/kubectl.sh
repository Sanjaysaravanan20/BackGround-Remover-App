#!/bin/bash
#script to install kubectl

#update the packages
sudo apt update -y

#install curl
sudo apt install curl -y

#download the latest kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl

#install kubectl wth correct permissions
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#verify the installation
kubectl version --client