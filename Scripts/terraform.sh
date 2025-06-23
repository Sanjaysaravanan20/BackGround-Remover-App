#!/bin/bash
#To install terraform an instance


#update the packages
sudo apt update -y
sudo apt install -y gnupg software-properties-common

#downloading the gpgkey for terraform
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

#verify the key fingerprint
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

#adding the hashi corp repo
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

#update the package list
sudo apt update -y

#installing the terraform
sudo apt install terraform -y

#verify the installation
terraform -v
