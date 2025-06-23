#!/bin/bash
#script to install grafana on ec2

#update packages list
sudo apt install -y apt-transport-https software-properties-common wget

#create directory for grafana keyrings
sudo mkdir -p /etc/apt/keyrings/

#add grafana keyrings to gpg
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor > /etc/apt/keyrings/grafana.gpg

#add grafana repo
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | tee /etc/apt/sources.list.d/grafana.list

#update the packages
sudo apt update -y

#install the grafana
sudo apt install grafana -y

#start and enable the grafana
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

#After installation, you can access Grafana at:
# http://your-server-ip:3000 (default user: admin, password: admin)