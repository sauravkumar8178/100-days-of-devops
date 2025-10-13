# 🧑‍💻 Day 7: Linux SSH Authentication

### 100 Days of DevOps Challenge — *KodeKloud Edition*

---

## 📘 Task

The system admins team of xFusionCorp Industries has set up scripts on the **jump host** that periodically run operations on all application servers in the Stratos Datacenter.

To ensure these automation scripts work properly, the **`thor`** user on the jump host must have **password-less SSH access** to all application servers via their respective **sudo users**.

---

## 🎯 Objective

* Configure secure, password-less SSH authentication from the jump host to all app servers.
* Ensure `thor` on the jump host can connect directly to:

  * `tony` @ App Server 1
  * `steve` @ App Server 2
  * `banner` @ App Server 3
* Validate that automated scripts can run without manual password entry.

---

## ⚙️ Step-by-Step Implementation

### 1️⃣ Access the Jump Host

```bash
ssh thor@jump_host
```

---

### 2️⃣ Generate an SSH Key Pair

```bash
ssh-keygen -t rsa
```

* Press **Enter** for all prompts (no passphrase).
* Keys created:

  * `~/.ssh/id_rsa`  → Private Key
  * `~/.ssh/id_rsa.pub`  → Public Key

---

### 3️⃣ Copy the Public Key to Each App Server

#### 🔹 App Server 1

```bash
ssh-copy-id tony@app_server_1
```

#### 🔹 App Server 2

```bash
ssh-copy-id steve@app_server_2
```

#### 🔹 App Server 3

```bash
ssh-copy-id banner@app_server_3
```

> 💡 If `ssh-copy-id` isn’t installed:

```bash
cat ~/.ssh/id_rsa.pub | ssh tony@app_server_1 \
"mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys"
```

---

### 4️⃣ Test Password-less SSH Access

```bash
ssh tony@app_server_1
ssh steve@app_server_2
ssh banner@app_server_3
```

✅ No password prompt should appear.

---

### 5️⃣ Verify Sudo Access

Check that each sudo user can execute root commands without a password:

```bash
ssh tony@app_server_1 "sudo -n whoami"
```

Expected output:

```
root
```

---

### 6️⃣ Automate the Setup (Optional)

Run the automation script:

```bash
chmod +x setup_passwordless_ssh.sh
./setup_passwordless_ssh.sh
```

This script:

* Generates an SSH key if missing
* Copies the public key to all target servers
* Tests the password-less SSH connectivity

---

## 🧠 Why This Matters

* Enables secure, automated operations between servers.
* Eliminates manual password handling in scripts.
* Improves reliability of centralized management tasks.
* Demonstrates key DevOps skill: secure remote automation.

---

## 🧰 Useful Commands

| Command                            | Description                               |
| ---------------------------------- | ----------------------------------------- |
| `ssh-keygen -t rsa`                | Generate new SSH key pair                 |
| `ssh-copy-id user@host`            | Copy public key to remote authorized_keys |
| `ssh user@host`                    | Connect to remote server                  |
| `chmod 700 ~/.ssh`                 | Secure `.ssh` directory                   |
| `chmod 600 ~/.ssh/authorized_keys` | Secure authorized keys file               |

---

## 📋 Summary

| Step | Action                       | Result                       |
| ---- | ---------------------------- | ---------------------------- |
| 1    | Login to jump host as `thor` | Session started              |
| 2    | Generate SSH keys            | Key pair created             |
| 3    | Copy keys to servers         | Keys deployed                |
| 4    | Test SSH access              | Password-less login verified |
| 5    | Check sudo                   | Root access confirmed        |
| 6    | Automate (optional)          | Script executed successfully |

---

## ✅ Outcome

* `thor` on the jump host can log in to `tony`, `steve`, and `banner` without a password.
* All automation scripts from the jump host now run smoothly.
* Secure, scalable SSH authentication verified.

---

## 🗒️ Notes

* Ensure each app server’s SSH service is running.
* Permissions must be correct for `.ssh` and `authorized_keys`.
* Use `ssh -vvv user@host` to debug SSH issues.

