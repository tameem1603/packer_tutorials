#!/bin/bash

# Update package index
sudo apt-get update

# Install AWS CLI
sudo apt-get install -y awscli

# Install CloudWatch Agent
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i amazon-cloudwatch-agent.deb
rm amazon-cloudwatch-agent.deb

# Install AWS SSM Agent
sudo snap install amazon-ssm-agent --classic

# Install Docker
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Install Git Client
sudo apt-get install -y git

# Verify installations
aws --version
amazon-cloudwatch-agent-ctl -a status
sudo systemctl status snap.amazon-ssm-agent.amazon-ssm-agent
docker --version
git --version

#Install java
sudo apt update
sudo apt install fontconfig openjdk-17-jre
java -version
openjdk version "17.0.13" 2024-10-15
OpenJDK Runtime Environment (build 17.0.13+11-Debian-2)
OpenJDK 64-Bit Server VM (build 17.0.13+11-Debian-2, mixed mode, sharing)
