
# Day 2: Temporary User Setup with Expiry ⏳

## Task
As part of the temporary assignment to the Nautilus project, a developer named **jim** requires access for a limited duration. To ensure smooth access management, a temporary user account with an expiry date is needed.

**Your Task:** Create a user named `jim` on **App Server 1** in **Stratos Datacenter**, and set the expiry date to **2024-04-15**. Ensure the username is in lowercase as per standard protocol.

---

## Step-by-Step Solution

### 1. Log in to App Server 1
```bash
ssh admin@app-server-1
````

* Replace `admin` with your admin username.
* Ensure you have `sudo` privileges.

### 2. Create the user with an expiry date

```bash
sudo useradd -e 2024-04-15 jim
```

**Explanation:**

* `-e 2024-04-15` → Sets the account expiry date.
* Username `jim` → Created in lowercase as per protocol.

### 3. (Optional) Set a password for the user

```bash
sudo passwd jim
```

### 4. Verify the user was created and expiry is set

```bash
sudo chage -l jim
```

**Expected output:**

```
Account expires : Apr 15, 2024
```

### 5. Additional Verification

* Check user exists:

```bash
getent passwd jim
```

* Ensure expiry is correct:

```bash
chage -l jim
```

---

## Notes / Tips

* Temporary users are useful for contractors, temporary projects, or testing purposes.
* Always follow lowercase naming conventions for users.
* Using `chage -l` ensures you can confirm account expiry quickly.

✅ **Task Completed:** User `jim` created successfully with expiry set to **2024-04-15**.



