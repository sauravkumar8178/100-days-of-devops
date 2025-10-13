#!/bin/bash
# --------------------------------------------
# Script: setup_passwordless_ssh.sh
# Purpose: Configure password-less SSH access
# Author: Saurav Kumar
# --------------------------------------------

declare -A SERVERS=(
  ["app_server_1"]="tony"
  ["app_server_2"]="steve"
  ["app_server_3"]="banner"
)

KEY_PATH="$HOME/.ssh/id_rsa"

echo "🔑 Checking for existing SSH key..."
if [ ! -f "$KEY_PATH" ]; then
  echo "➡️  Generating new SSH key..."
  ssh-keygen -t rsa -N "" -f "$KEY_PATH"
else
  echo "✅ SSH key already exists."
fi

for SERVER in "${!SERVERS[@]}"; do
  USER=${SERVERS[$SERVER]}
  echo ""
  echo "🚀 Copying SSH key to $USER@$SERVER ..."
  if command -v ssh-copy-id &>/dev/null; then
    ssh-copy-id -o StrictHostKeyChecking=no "$USER@$SERVER"
  else
    PUB_KEY=$(cat "$KEY_PATH.pub")
    ssh -o StrictHostKeyChecking=no "$USER@$SERVER" \
    "mkdir -p ~/.ssh && echo '$PUB_KEY' >> ~/.ssh/authorized_keys && chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys"
  fi

  echo "🧪 Testing connection to $USER@$SERVER ..."
  ssh -o BatchMode=yes "$USER@$SERVER" "echo '✅ Connected to $(hostname)'" || echo "❌ Connection failed for $USER@$SERVER"
done

echo ""
echo "🎉 Password-less SSH setup completed successfully for all app servers!"
