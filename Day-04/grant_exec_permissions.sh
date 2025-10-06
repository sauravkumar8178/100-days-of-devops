#!/bin/bash
# ===========================================
# Day 4: Grant Script Execution Permissions
# Author: Saurav Kumar
# ===========================================

SCRIPT_PATH="/tmp/xfusioncorp.sh"

# Check if script exists
if [ -f "$SCRIPT_PATH" ]; then
    echo "🔧 Granting read + execute permissions to all users for $SCRIPT_PATH..."
    sudo chmod a+rx "$SCRIPT_PATH"
    echo "✅ Permissions updated successfully!"
    ls -l "$SCRIPT_PATH"
else
    echo "❌ Script $SCRIPT_PATH not found!"
fi

# Run the script:
chmod +x grant_exec_permissions.sh
sudo ./grant_exec_permissions.sh
