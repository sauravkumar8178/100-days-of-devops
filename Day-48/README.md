# Day 48: Deploy Pods in Kubernetes Cluster ☸️

**Task:**
The Nautilus DevOps team needs to create a pod in the Kubernetes cluster with the following specifications:

* **Pod Name:** `pod-httpd`
* **Container Image:** `httpd:latest`
* **Label:** `app=httpd_app`
* **Container Name:** `httpd-container`

---

## Step-by-Step Solution

### **Step 1: Create a YAML file for the pod**

Create a file named `pod-httpd.yaml`:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-httpd
  labels:
    app: httpd_app
spec:
  containers:
    - name: httpd-container
      image: httpd:latest
```

> This YAML defines a pod with a single container using the `httpd:latest` image and labels it with `app=httpd_app`.

---

### **Step 2: Deploy the pod**

Use `kubectl` to create the pod from the YAML file:

```bash
kubectl apply -f pod-httpd.yaml
```

You should see output like:

```
pod/pod-httpd created
```

---

### **Step 3: Verify the pod is running**

Check the pod status:

```bash
kubectl get pods
```

Example output:

```
NAME         READY   STATUS    RESTARTS   AGE
pod-httpd    1/1     Running   0          1m
```

---

### **Step 4: Describe the pod (optional)**

Get detailed information about the pod:

```bash
kubectl describe pod pod-httpd
```

---

### **Step 5: Access logs (optional)**

Check the container logs:

```bash
kubectl logs pod-httpd
```

> Since `httpd` is a web server, you might see startup messages in the logs.

---

✅ **Task Complete:**
You have successfully deployed a pod named `pod-httpd` in the Kubernetes cluster with the required label and container specifications.

