## 🔐 Day 5: SELinux Installation and Configuration

### **📌 Task**

Following a security audit, the xFusionCorp Industries security team decided to enhance server and application security using **SELinux**.

**App Server 2** has the following requirements:

1. Install the required SELinux packages.
2. Permanently **disable SELinux** temporarily for configuration purposes.
3. No need to reboot the server now (scheduled maintenance reboot tonight).
4. Disregard the current SELinux status; after reboot, SELinux should remain **disabled**.

---

### **🎯 Objective**

* Install SELinux for enhanced security capabilities.
* Configure SELinux to be **disabled after reboot** temporarily.
* Understand SELinux package management and configuration in Linux.

---

### **⚙️ Step-by-Step Solution**

1. **Access App Server 2:**

```bash
ssh admin@app-server-2
```

2. **Install SELinux packages:**

```bash
sudo yum install -y selinux-policy selinux-policy-targeted policycoreutils
```

> For Debian/Ubuntu systems, use:

```bash
sudo apt install -y selinux-utils selinux-basics
```

3. **Check SELinux status (optional):**

```bash
sestatus
```

* Can be ignored for this task, as final configuration is required to be disabled.

4. **Permanently disable SELinux:**

* Open the SELinux configuration file:

```bash
sudo nano /etc/selinux/config
```

* Change the line:

```
SELINUX=enforcing
```

to

```
SELINUX=disabled
```

5. **Save and close the file.**

* No reboot is needed now; the scheduled maintenance reboot will apply this change.

6. **Verify configuration file (optional):**

```bash
grep SELINUX /etc/selinux/config
```

Expected output:

```
SELINUX=disabled
```
---

### **🧰 Useful Commands**

| Command                         | Description                              |
| ------------------------------- | ---------------------------------------- |
| `sestatus`                      | Check current SELinux status             |
| `getenforce`                    | Display current SELinux mode             |
| `sudo nano /etc/selinux/config` | Edit SELinux configuration file          |
| `sudo yum install <package>`    | Install SELinux packages (RHEL/CentOS)   |
| `sudo apt install <package>`    | Install SELinux packages (Debian/Ubuntu) |

---

### **✅ Outcome**

* SELinux packages are installed.
* SELinux is configured to be **disabled permanently** after reboot.
* Server is ready for future SELinux configuration testing.

