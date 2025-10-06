## 🛡️ Day 3: Secure Root SSH Access

### **📘 Task**

The Nautilus DevOps team recently performed a security audit and discovered that root SSH access was still enabled on several servers. Allowing root users to log in remotely poses a major security risk.

Your task is to:

1. Disable **root SSH access** on the system.
2. Allow only specific users (like `saurav` or `devopsadmin`) to access the server via SSH.
3. Ensure SSH service restarts successfully after configuration.
4. Verify that root cannot log in remotely.

---

### **🎯 Objective**

* Prevent remote SSH access for the root user.
* Allow controlled SSH access for authorized users only.
* Harden server security through proper SSH configuration.

---

### **⚙️ Step-by-Step Implementation**

#### **1️⃣ Access the Server**

Login as root or a sudo-enabled user:

```bash
ssh root@<server-ip>
```

---

#### **2️⃣ Open the SSH Configuration File**

Edit the SSH daemon configuration:

```bash
sudo nano /etc/ssh/sshd_config
```

---

#### **3️⃣ Disable Root Login**

Find the line:

```
#PermitRootLogin yes
```

Uncomment it and change to:

```
PermitRootLogin no
```

---

#### **4️⃣ Allow Specific Users**

Add a line to allow only trusted users:

```
AllowUsers saurav devopsadmin
```

---

#### **5️⃣ Restart SSH Service**

Apply changes:

```bash
sudo systemctl restart sshd
```

---

#### **6️⃣ Verify Configuration**

Attempt to log in as root:

```bash
ssh root@<server-ip>
```

✅ It should show **Permission denied**.
✅ Allowed users can log in successfully.

---

### **🧠 Why This Matters**

* Minimizes attack surface for brute-force or password-guessing attempts.
* Enforces **least privilege principle**.
* Enhances **system hardening and compliance** with security best practices.

---

### **🧰 Useful Commands**

| Command                          | Description              |
| -------------------------------- | ------------------------ |
| `sudo systemctl status sshd`     | Check SSH service status |
| `sudo tail -f /var/log/auth.log` | Monitor login attempts   |
| `sudo who`                       | Check logged-in users    |

---

### **📋 Summary**

| Step | Action                 | Result                     |
| ---- | ---------------------- | -------------------------- |
| 1    | Disable root SSH login | Root remote access blocked |
| 2    | Allow specific users   | Controlled SSH access      |
| 3    | Restart SSH daemon     | Apply secure configuration |
| 4    | Test access            | Confirm restricted access  |

---

### **✅ Outcome**

* Root login is **disabled** over SSH.
* Only **authorized users** can log in.
* Server is **more secure** against unauthorized access.



