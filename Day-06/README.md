# 🕐 Day 6: Create a Cron Job

### 100 Days of DevOps Challenge — *KodeKloud Edition*

---

## 📘 Task

The Nautilus system administrators team wants to automate several day-to-day operational tasks using scheduled jobs.
Before deploying the main automation scripts, they need to **test a sample cron job** on all application servers.

Your task is to:
1️⃣ Install the `cronie` package on all Nautilus app servers.
2️⃣ Start and enable the `crond` service.
3️⃣ Create a cron job for the **root user** that runs **every 5 minutes** and executes:

```bash
echo hello > /tmp/cron_text
```

---

## 🎯 Objective

* Automate recurring tasks using **cron**.
* Ensure `cronie` and `crond` services are properly installed and running.
* Schedule a cron job that executes reliably at defined intervals.
* Verify that the job runs successfully and outputs the expected result.

---

## ⚙️ Step-by-Step Implementation

### 1️⃣ Access the Server

Log in to the target server with root privileges:

```bash
ssh root@<server-ip>
```

If not root, switch user:

```bash
sudo su -
```

---

### 2️⃣ Install Cron Package

#### 🟢 On RHEL / CentOS / Rocky Linux

```bash
yum install cronie -y
systemctl start crond
systemctl enable crond
```

#### 🔵 On Ubuntu / Debian

```bash
apt update -y
apt install cron -y
systemctl start cron
systemctl enable cron
```

---

### 3️⃣ Verify Cron Service

Check whether the cron daemon is running:

```bash
systemctl status crond       # For RHEL/CentOS
systemctl status cron        # For Ubuntu/Debian
```

✅ It should show **active (running)**.

---

### 4️⃣ Add the Cron Job for Root

Edit the root crontab:

```bash
crontab -e
```

Add the following line:

```bash
*/5 * * * * echo hello > /tmp/cron_text
```

Save and exit the editor.

---

### 5️⃣ Verify Cron Job

List all current cron jobs for root:

```bash
crontab -l
```

You should see:

```
*/5 * * * * echo hello > /tmp/cron_text
```

---

### 6️⃣ Validate Output

Wait 5 minutes for the cron to execute, then check:

```bash
cat /tmp/cron_text
```

✅ Output should be:

```
hello
```

---

### 7️⃣ (Optional) Automate Using Script

You can automate all the above steps using the script:
[`setup_cron.sh`](./setup_cron.sh)

Run it as root:

```bash
chmod +x setup_cron.sh
sudo ./setup_cron.sh
```

This script:

* Installs `cronie` (or `cron` for Debian)
* Starts & enables the cron service
* Adds the scheduled cron job automatically

---

## 🧠 Why This Matters

* Ensures repetitive administrative tasks are automated.
* Reduces manual errors and operational overhead.
* Demonstrates the foundation of **system scheduling** and **job automation**.
* Essential skill for CI/CD, monitoring, and server maintenance tasks.

---

## 🧰 Useful Commands

| Command                     | Description                     |
| --------------------------- | ------------------------------- |
| `crontab -e`                | Edit current user's cron jobs   |
| `crontab -l`                | List existing cron jobs         |
| `systemctl status crond`    | Check cron daemon status        |
| `grep CRON /var/log/syslog` | View cron logs on Ubuntu/Debian |
| `grep CROND /var/log/cron`  | View cron logs on RHEL/CentOS   |
| `cat /tmp/cron_text`        | Verify output of the cron job   |

---

## 📋 Summary

| Step | Action                 | Result                           |
| ---- | ---------------------- | -------------------------------- |
| 1    | Install cronie/cron    | Cron package installed           |
| 2    | Start and enable crond | Cron service running             |
| 3    | Add cron job           | Job created successfully         |
| 4    | Wait & verify output   | File updated every 5 minutes     |
| 5    | Automate (optional)    | Script setup tested successfully |

---

## ✅ Outcome

* Cron service is installed and running.
* A scheduled task executes every 5 minutes.
* File `/tmp/cron_text` contains the word **hello**.
* Automation tested and verified successfully.

---

## 🗒️ Notes

* Ensure system time synchronization (using `chronyd` or `ntpd`) for accurate scheduling.
* Use `>>` instead of `>` if you want to append logs instead of overwriting.
* Always test new cron entries manually before applying in production.

