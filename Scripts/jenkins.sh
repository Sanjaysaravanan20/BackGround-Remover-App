#!/bin/bash
#this script belongs to mine
#jenkins installation on ubuntu server
sudo apt update -y

#for jenkins we need to install the java and it supports versions are jdk 11,17,21
sudo apt install fontconfig openjdk-17-jre -y

#downloading the jenkins key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
  
sudo apt-get update -y
sudo apt-get install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins