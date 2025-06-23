#!/bin/bash
#script to install awscli'

#download the aws cli installer
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

#install the unzip package
sudo apt install unzip -y

#unzip the awscli installer
unzip awscliv2.zip

#run the aws script
sudo ./aws/install

#verify the installation
aws --version