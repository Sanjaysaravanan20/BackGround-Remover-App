#!/bin/bash
#script to install promethus

#update the packages
sudo apt update -y

#create system user 
sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --system -g prometheus prometheus

#creating directory for prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

#downloading and extracting the prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.43.0/prometheus-2.43.0.linux-amd64.tar.gz
tar vxf prometheus*.tar.gz

#move all extracted files to prometheus
sudo mv prometheus /usr/local/bin
sudo mv promtool /usr/local/bin

#set permissions 
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool

#move configuration files
sudo mv consoles /etc/prometheus
sudo mv console_libraries /etc/prometheus
sudo mv prometheus.yml /etc/prometheus

sudo chown prometheus:prometheus /etc/prometheus
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
sudo chown -R prometheus:prometheus /var/lib/prometheus

#create prometheus systemd file
cat <<EOF | sudo tee /etc/systemd/system/prometheus.service
[Unit]
Description=Prometheus Monitoring System
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \\
  --config.file=/etc/prometheus/prometheus.yml \\
  --storage.tsdb.path=/etc/prometheus/data \\
  --web.console.templates=/etc/prometheus/consoles \\
  --web.console.libraries=/etc/prometheus/console_libraries

Restart=always

[Install]
WantedBy=multi-user.target
EOF

#reload the systemd 
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl start prometheus

#check the prometheus status
sudo systemctl status prometheus