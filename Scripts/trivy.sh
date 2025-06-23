#!/bin/bash
#script to install trivy on ec2

#update the packages
sudo apt install wget apt-transport-https gnupg lsb-release

#add the trivy repo
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -

#add the trivy repo to list
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list

#update the packages
sudo apt update -y

#install trivy
sudo apt install trivy -y