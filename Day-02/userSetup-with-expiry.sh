
---

## 📜 `day2_create_user.sh`

```bash
#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e

# Variables
USERNAME="jim"
EXPIRY="2024-04-15"

# Create user with expiry
echo "Creating user $USERNAME with expiry date $EXPIRY..."
sudo useradd -e $EXPIRY $USERNAME

# (Optional) Set a default password
# echo "$USERNAME:Password@123" | sudo chpasswd

# Verify
echo "Verifying user details..."
sudo chage -l $USERNAME

echo "User $USERNAME created successfully with expiry $EXPIRY."


# ⚡ To run the script:
chmod +x userSetup-with-expiry.sh
./userSetup-with-expiry.sh
