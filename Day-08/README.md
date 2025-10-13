# ⚙️ Day 8: Install Ansible

### 🧭 Task

During the weekly meeting, the **Nautilus DevOps team** discussed implementing an automation and configuration management solution.
After evaluating several tools, they chose **Ansible** because of its **simplicity**, **agentless design**, and **minimal setup requirements**.

Your task is to:

* Install **Ansible version 4.8.0** on the **Jump Host** using **pip3 only**.
* Ensure the **Ansible binary** is **available globally**, so **all users** can execute Ansible commands.

---

## 🎯 Objectives

* ✅ Install Ansible via **pip3**
* ✅ Ensure version = **4.8.0**
* ✅ Make it **globally accessible** for all users

---

## ⚙️ Steps to Complete the Task

### 1️⃣ Update System Packages

```bash
sudo yum update -y
```

### 2️⃣ Install Python3 and pip3 (if not already installed)

```bash
sudo yum install python3 python3-pip -y
```

Verify installation:

```bash
python3 --version
pip3 --version
```

---

### 3️⃣ Install Ansible (version 4.8.0) using pip3

```bash
sudo pip3 install ansible==4.8.0
```

> ⚠️ Using `sudo` ensures it installs system-wide so that all users can access Ansible.

---

### 4️⃣ Verify Ansible Installation

```bash
ansible --version
```

Expected output:

```
ansible [core 2.11.x]
  config file = None
  python version = 3.x.x
  ansible version = 4.8.0
```

---

### 5️⃣ Ensure the Binary is Available Globally

Check where Ansible was installed:

```bash
which ansible
```

If it’s in a user-specific path like `/usr/local/bin/ansible`, create a global symlink:

```bash
sudo ln -s /usr/local/bin/ansible /usr/bin/ansible
```

Now verify again:

```bash
ansible --version
```

---

### 6️⃣ Validate Access for All Users

Switch to another user to confirm:

```bash
su - <username>
ansible --version
```

If it returns version `4.8.0`, the setup is correct ✅

---

## 🧩 Outcome

* ✅ Ansible **4.8.0** installed using **pip3**
* ✅ Binary available globally
* ✅ Ready for use on **Jump Host** as **Ansible Controller**

---

## 📊 Summary Table

| Step | Description            | Command                                              |
| ---- | ---------------------- | ---------------------------------------------------- |
| 1    | Update system          | `sudo yum update -y`                                 |
| 2    | Install Python3 & pip3 | `sudo yum install python3 python3-pip -y`            |
| 3    | Install Ansible 4.8.0  | `sudo pip3 install ansible==4.8.0`                   |
| 4    | Verify version         | `ansible --version`                                  |
| 5    | Ensure global access   | `sudo ln -s /usr/local/bin/ansible /usr/bin/ansible` |

---

## ⚠️ Common Issues & Fixes

| Issue                            | Cause                                 | Fix                                                                  |
| -------------------------------- | ------------------------------------- | -------------------------------------------------------------------- |
| `ansible: command not found`     | PATH doesn’t include `/usr/local/bin` | Create symlink: `sudo ln -s /usr/local/bin/ansible /usr/bin/ansible` |
| `pip3: command not found`        | pip3 not installed                    | `sudo yum install python3-pip -y`                                    |
| Permission denied during install | No sudo privileges                    | Run `sudo pip3 install ansible==4.8.0`                               |

---

✅ **Day 8 Completed:**
Ansible 4.8.0 Installed on Jump Host (RHEL-based) and Globally Accessible

