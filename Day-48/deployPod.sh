
#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e

# Create pod-httpd.yaml file
cat <<EOF > pod-httpd.yaml
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
EOF

# Deploy the pod
kubectl apply -f pod-httpd.yaml

# Verify pod status
kubectl get pods

# single `kubectl run` command version
kubectl run pod-httpd \
  --image=httpd:latest \
  --labels="app=httpd_app" \
  --container-name=httpd-container

