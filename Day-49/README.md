# Day 49: Deploy Applications with Kubernetes Deployments 🚀

### Task

The Nautilus DevOps team needs to deploy an **nginx** application in the Kubernetes cluster using a **Deployment**.

Your Task:

* Create a **Deployment** named `nginx`
* Use the image `nginx:latest`
* Ensure the `latest` tag is specified

---

### Step-by-Step Solution

1. **Check kubectl access**
   Make sure you can access the cluster from `jump_host`:

   ```bash
   kubectl cluster-info
   ```

   You should see cluster information if connected properly.

2. **Create the deployment using kubectl**
   Use the following command:

   ```bash
   kubectl create deployment nginx --image=nginx:latest
   ```

3. **Verify the deployment**
   Check the deployment details:

   ```bash
   kubectl get deployments
   ```

   Output should show something like:

   ```
   NAME    READY   UP-TO-DATE   AVAILABLE   AGE
   nginx   1/1     1            1           10s
   ```

4. **Check the pods created by the deployment**

   ```bash
   kubectl get pods
   ```

   You should see a pod with a name starting with `nginx-` in `Running` status.

5. **Optional: Describe deployment for details**

   ```bash
   kubectl describe deployment nginx
   ```

   This shows info about replica sets, pod templates, and labels.

---

✅ **Outcome:**
The `nginx` deployment is running with the `nginx:latest` image, and Kubernetes manages pod scaling automatically.

Perfect! Here’s a **declarative YAML file** for your `nginx` deployment:

---
 
### Using `nginx-deployment.yaml`

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
  labels:
    app: nginx_app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx_app
  template:
    metadata:
      labels:
        app: nginx_app
    spec:
      containers:
        - name: nginx-container
          image: nginx:latest
          ports:
            - containerPort: 80
```

---

### Steps to Apply the Deployment

1. **Create the deployment using the YAML file**

```bash
kubectl apply -f nginx-deployment.yaml
```

2. **Verify the deployment**

```bash
kubectl get deployments
kubectl get pods
```

3. **Check deployment details**

```bash
kubectl describe deployment nginx
```

---

✅ **Explanation:**

* `replicas: 1` → Only one pod will run initially. You can scale later.
* `selector.matchLabels` → Ensures the Deployment manages the pods with `app: nginx_app` label.
* `containerPort: 80` → Default port for nginx.
