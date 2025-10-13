#!/bin/bash
# ------------------------------------------
# Script Name: setup_cron.sh
# Description: Installs cronie, starts crond,
#              and sets up a cron job to run every 5 mins
# Author: Saurav Kumar
# ------------------------------------------

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "❌ Please run this script as root"
  exit 1
fi

echo "🚀 Starting cron setup..."

# Detect OS family
if [ -f /etc/redhat-release ]; then
    OS="rhel"
elif [ -f /etc/debian_version ]; then
    OS="debian"
else
    echo "⚠️ Unsupported OS. Please install cronie manually."
    exit 1
fi

# Install cron package
echo "📦 Installing cronie/cron..."
if [ "$OS" == "rhel" ]; then
    yum install -y cronie
    systemctl enable crond
    systemctl start crond
elif [ "$OS" == "debian" ]; then
    apt update -y
    apt install -y cron
    systemctl enable cron
    systemctl start cron
fi

# Add cron job
echo "🕐 Adding cron job for root user..."
CRON_JOB="*/5 * * * * echo hello > /tmp/cron_text"

# Check if job already exists
(crontab -l 2>/dev/null | grep -q "$CRON_JOB") || (
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
)

# Verify setup
echo "✅ Cron job has been added successfully."
echo "Check existing cron jobs using: crontab -l"
echo "Cron output will be stored in: /tmp/cron_text"
