#!/bin/bash

echo "package update ----"
sudo apt-get update -y # update package list

# install dependencies securly
echo "installing dependencies ----"
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

# add  GPG key from docker offical server
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Set up the stable repository for Docker
echo "Setting up Docker repository..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the package index again after adding Docker repo
echo "Updating package index again..."
sudo apt-get update -y

# Install Docker
echo "Installing Docker..."
sudo apt-get install docker-ce -y

# Start Docker and enable it to run on boot
echo "Starting Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

# Verify Docker installation
echo "Verifying Docker installation..."
docker --version

# Check if Docker is running
echo "Checking Docker service status..."
sudo systemctl status docker --no-pager

echo "Docker installation completed successfully!"



#make this bash script executable, "chmod +x install-docker.sh" - 
#run the script "./install-docker.sh"





