#!/bin/bash
# ===========================================
# Day 5: SELinux Installation and Configuration
# Author: Saurav Kumar
# ===========================================

# Install SELinux packages (Red Hat/CentOS example)
echo "📦 Installing SELinux packages..."
sudo yum install -y selinux-policy selinux-policy-targeted policycoreutils

# Disable SELinux permanently
CONFIG_FILE="/etc/selinux/config"

if [ -f "$CONFIG_FILE" ]; then
    echo "🔧 Disabling SELinux permanently..."
    sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/' $CONFIG_FILE
    echo "✅ SELinux configuration updated:"
    grep SELINUX $CONFIG_FILE
else
    echo "❌ SELinux config file not found!"
fi

echo "⚠️ Note: SELinux changes will take effect after the next reboot."

# Run the script:
chmod +x configure_selinux.sh
sudo ./configure_selinux.sh
