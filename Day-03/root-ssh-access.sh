#!/bin/bash
# ===========================================
# Day 3: Secure Root SSH Access (100 Days of DevOps)
# Author: Saurav Kumar
# ===========================================

ALLOWED_USERS=("saurav" "devopsadmin")

echo "📦 Backing up SSH configuration..."
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak_$(date +%F_%T)

echo "🔒 Disabling root SSH login..."
sudo sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

echo "👥 Allowing specific users..."
ALLOW_USERS_LINE="AllowUsers ${ALLOWED_USERS[*]}"
if grep -q "^AllowUsers" /etc/ssh/sshd_config; then
    sudo sed -i "s/^AllowUsers.*/$ALLOW_USERS_LINE/" /etc/ssh/sshd_config
else
    echo "$ALLOW_USERS_LINE" | sudo tee -a /etc/ssh/sshd_config > /dev/null
fi

echo "🔁 Restarting SSH service..."
sudo systemctl restart sshd

sudo systemctl is-active --quiet sshd && echo "✅ SSH service restarted successfully."

echo "==========================================="
echo "✅ SSH Security Configuration Completed!"
echo " Root login: DISABLED"
echo " Allowed users: ${ALLOWED_USERS[*]}"
echo " Backup file: /etc/ssh/sshd_config.bak_<timestamp>"
echo "==========================================="
