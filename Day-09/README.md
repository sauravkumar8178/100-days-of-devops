# 🛠️ Day 9: MariaDB Troubleshooting

### 100 Days of DevOps

---

## 📘 Task

The Nautilus application in the Stratos DC is experiencing a critical issue: the **application cannot connect to the database**. Investigation revealed that the **MariaDB service on the database server is down**.

**Objective:** Investigate the failure and restore MariaDB functionality.

---

## 🎯 Objectives

* Identify why the MariaDB service failed to start.
* Resolve the issue preventing startup.
* Ensure the MariaDB service runs correctly and automatically on boot.
* Verify application connectivity to the database.

---

## 🧰 Step-by-Step Guide

### 1. Check MariaDB service status

```bash
sudo systemctl status mariadb
```

* Found: `Active: failed (Result: exit-code)`
* Indicates startup failure, likely due to **InnoDB logs, permissions, or config issues**.

---

### 2. Review MariaDB logs

```bash
sudo journalctl -xeu mariadb.service
sudo cat /var/log/mariadb/mariadb.log
```

* Look for errors like:

  * `InnoDB: Unable to lock ./ibdata1`
  * `Permission denied`
  * `Corrupt log file`

---

### 3. Fix common issues

#### a) Permissions on the data directory

```bash
sudo chown -R mysql:mysql /var/lib/mysql
sudo chmod -R 750 /var/lib/mysql
```

#### b) Remove corrupted InnoDB logs

```bash
sudo mv /var/lib/mysql/ib_logfile0 /var/lib/mysql/ib_logfile0.bak
sudo mv /var/lib/mysql/ib_logfile1 /var/lib/mysql/ib_logfile1.bak
```

#### c) Validate MariaDB configuration

```bash
sudo mysqld --validate-config
```

* Fix any misconfigurations in `/etc/my.cnf` or included `.cnf` files.

---

### 4. Restart MariaDB

```bash
sudo systemctl restart mariadb
sudo systemctl status mariadb
```

* Ensure `Active: active (running)` appears.

---

### 5. Enable MariaDB to start on boot

```bash
sudo systemctl enable mariadb
```

---

### 6. Verify database connectivity

```bash
mysql -u root -p
SHOW DATABASES;
```

* Confirm the Nautilus application can now connect to the database.

---

## ✅ Outcome

* MariaDB service is running and stable.
* Application connectivity is restored.
* MariaDB is configured to start automatically on reboot.
* Logs confirm no critical errors.

---

## 📊 Summary Table

| Step | Action                    | Result                                        |
| ---- | ------------------------- | --------------------------------------------- |
| 1    | Checked MariaDB status    | Found service failed                          |
| 2    | Reviewed logs             | Identified potential InnoDB/permissions issue |
| 3    | Fixed permissions & logs  | Prepared MariaDB for restart                  |
| 4    | Restarted MariaDB         | Service running successfully                  |
| 5    | Enabled auto-start        | MariaDB starts on boot                        |
| 6    | Verified app connectivity | Nautilus application working                  |

