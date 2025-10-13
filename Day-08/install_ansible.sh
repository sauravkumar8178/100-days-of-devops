#!/bin/bash

# 🚀 Day 8 - Install Ansible 4.8.0 on RHEL/CentOS/Rocky Linux

# Exit on any error
set -e

echo "🔹 Updating system packages..."
sudo yum update -y

echo "🔹 Installing Python3 and pip3..."
sudo yum install -y python3 python3-pip

echo "🔹 Installing Ansible version 4.8.0..."
sudo pip3 install ansible==4.8.0

# Check Ansible binary location
ANSIBLE_PATH=$(which ansible)

# Create symlink if not in /usr/bin
if [[ "$ANSIBLE_PATH" != "/usr/bin/ansible" ]]; then
    echo "🔹 Creating global symlink for Ansible..."
    sudo ln -sf "$ANSIBLE_PATH" /usr/bin/ansible
fi

echo "🔹 Verifying Ansible installation..."
ansible --version

echo "✅ Ansible 4.8.0 installed successfully and available globally!"

# Save the file as install_ansible.sh
# Make it executable:
chmod +x install_ansible.sh


#Run the script:
./install_ansible.sh