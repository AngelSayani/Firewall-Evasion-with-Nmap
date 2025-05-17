#!/bin/bash

# Setup script for the Ubuntu target machine


# Install basic packages 
sudo apt update -y
sudo apt install -y openssh-server

# Add a hosts entry for the Kali machine
echo "10.0.0.5 kali" | sudo tee -a /etc/hosts

echo "Target setup complete"
