#!/bin/bash
# Day 1: Create user 'yousuf' with a non-interactive shell

# Exit immediately if a command exits with a non-zero status
set -e

# Create user with a non-interactive shell
sudo useradd -m -s /sbin/nologin yousuf

# Verify user creation
echo "User created successfully:"
getent passwd yousuf
