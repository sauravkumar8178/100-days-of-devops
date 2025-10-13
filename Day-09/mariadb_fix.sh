#!/bin/bash
# 🛠️ MariaDB Troubleshooting Script
# Day 9: 100 Days of DevOps
# This script checks MariaDB status, fixes common startup issues, and restarts the service.

LOGFILE="/var/log/mariadb_fix.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$TIMESTAMP] Starting MariaDB troubleshooting..." | tee -a $LOGFILE

# Step 1: Check MariaDB status
systemctl is-active --quiet mariadb
STATUS=$?

if [ $STATUS -eq 0 ]; then
    echo "[$TIMESTAMP] MariaDB is already running." | tee -a $LOGFILE
    exit 0
else
    echo "[$TIMESTAMP] MariaDB is not running. Attempting to fix..." | tee -a $LOGFILE
fi

# Step 2: Fix permissions
echo "[$TIMESTAMP] Fixing permissions on /var/lib/mysql..." | tee -a $LOGFILE
chown -R mysql:mysql /var/lib/mysql
chmod -R 750 /var/lib/mysql

# Step 3: Backup and remove corrupted InnoDB logs (if they exist)
if [ -f /var/lib/mysql/ib_logfile0 ]; then
    echo "[$TIMESTAMP] Backing up InnoDB log files..." | tee -a $LOGFILE
    mv /var/lib/mysql/ib_logfile0 /var/lib/mysql/ib_logfile0.bak
    mv /var/lib/mysql/ib_logfile1 /var/lib/mysql/ib_logfile1.bak
fi

# Step 4: Restart MariaDB service
echo "[$TIMESTAMP] Restarting MariaDB service..." | tee -a $LOGFILE
systemctl restart mariadb

# Step 5: Verify status
systemctl is-active --quiet mariadb
STATUS=$?

if [ $STATUS -eq 0 ]; then
    echo "[$TIMESTAMP] MariaDB restarted successfully!" | tee -a $LOGFILE
    # Enable auto-start on boot
    systemctl enable mariadb
else
    echo "[$TIMESTAMP] MariaDB failed to start. Check logs for details." | tee -a $LOGFILE
    journalctl -xeu mariadb.service | tail -n 50 | tee -a $LOGFILE
    exit 1
fi

# Step 6: Test database connectivity
echo "[$TIMESTAMP] Testing MariaDB connectivity..." | tee -a $LOGFILE
mysqladmin ping &>/dev/null
if [ $? -eq 0 ]; then
    echo "[$TIMESTAMP] MariaDB is responding to connections." | tee -a $LOGFILE
else
    echo "[$TIMESTAMP] MariaDB is running but not responding to connections." | tee -a $LOGFILE
fi

echo "[$TIMESTAMP] MariaDB troubleshooting script completed." | tee -a $LOGFILE
