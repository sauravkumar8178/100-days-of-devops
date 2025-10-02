# Day 1: Linux User Setup with Non-Interactive Shell 🐧

## **Task**

To accommodate the backup agent tool's specifications, the system admin team at **xFusionCorp Industries** requires the creation of a user with a non-interactive shell.

**Your Task:**
Create a user named `yousuf` with a non-interactive shell on **App Server 1**.

---

## **Step-by-Step Solution**

### **1. Log in to App Server 1**

```bash
ssh admin@app-server-1
```

* Replace `admin` with your admin username.
* Ensure you have sudo privileges.

---

### **2. Create the user with a non-interactive shell**

```bash
sudo useradd -m -s /sbin/nologin yousuf
```

**Explanation:**

* `-m` → Creates a home directory `/home/yousuf`
* `-s /sbin/nologin` → Assigns a non-interactive shell (prevents login)

---

### **3. Verify the user was created**

```bash
getent passwd yousuf
```

**Expected output:**

```
yousuf:x:1001:1001::/home/yousuf:/sbin/nologin
```

---

### **4. Test the non-interactive shell**

Try switching to the user:

```bash
su - yousuf
```

**Expected output:**

```
This account is currently not available.
```

* This confirms the user **cannot log in interactively**, which is required for backup agent purposes.

---

### **5. Notes / Tips**

* Non-interactive users are useful for **automation and scripts**, like backup agents or system services.
* Common non-interactive shells: `/sbin/nologin` or `/usr/sbin/nologin`.
* Always verify by attempting login to avoid mistakes.

---

✅ **Task Completed:** User `yousuf` created successfully with a non-interactive shell.

