#!/bin/bash
#script to install docker on ec2 instance

#update the packages
sudo apt update -y

#install docker
sudo apt install docker.io -y

#add the ubuntu and jenkins to docker group to allow run without sudo
sudo usermod -aG docker ubuntu
sudo usermod -aG docker jenkins

#apply the new grp immediately
newgrp docker

#set the correct permission to docker socket to allow docker group members to access it
sudo chmod 660 /var/run/docker.sock
sudo chown root:docker /var/run/docker.sock

#restart the docker to apply changes
sudo systemctl restart docker

#verify the version
docker --version

# Run SonarQube container in detached mode with port mapping
#docker run -d --name sonar -p 9000:9000 sonarqube:lts-community