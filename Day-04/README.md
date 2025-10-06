## 🛠️ Day 4: Script Execution Permissions

### **📌 Task**

The xFusionCorp Industries sysadmin team created a bash script named `xfusioncorp.sh` to automate backup processes.
While it has been distributed to all necessary servers, **App Server 1** lacks proper executable permissions for this script.

**Your task:**

1. Grant **executable permissions** to `/tmp/xfusioncorp.sh`.
2. Ensure **all users** can execute the script correctly (read + execute).

---

### **🎯 Objective**

* Make the script executable so it runs without errors.
* Ensure all users can execute the script for proper automation.
* Apply correct Linux file permission management.

---

### **⚙️ Step-by-Step Solution**

1. **Access App Server 1:**

```bash
ssh admin@app-server-1
```

2. **Verify current permissions:**

```bash
ls -l /tmp/xfusioncorp.sh
```

Example output:

```
---x--x--x 1 root root 40 Oct 6 19:38 /tmp/xfusioncorp.sh
```

* Script **can execute**, but **cannot be read**, which may cause errors.

3. **Grant read and execute permissions for all users:**

```bash
sudo chmod a+rx /tmp/xfusioncorp.sh
```

* `a+rx` → adds **read + execute** permissions for owner, group, and others.

4. **Verify updated permissions:**

```bash
ls -l /tmp/xfusioncorp.sh
```

Expected output:

```
-r-xr-xr-x 1 root root 40 Oct 6 19:38 /tmp/xfusioncorp.sh
```

5. **Test execution as a regular user:**

```bash
/tmp/xfusioncorp.sh
```

✅ Script should run successfully without errors.

---

### **🧰 Useful Commands**

| Command             | Description                                  |
| ------------------- | -------------------------------------------- |
| `ls -l <file>`      | Check file permissions                       |
| `chmod a+rx <file>` | Grant read + execute permission to all users |
| `whoami`            | Check current user                           |
| `./<script>`        | Execute the script                           |

---

### **✅ Outcome**

* `/tmp/xfusioncorp.sh` is now **readable and executable** by all users.
* Backup automation script can run without errors.
* Linux file permissions are correctly applied and verified.


