---
apiVersion: v1
preferences: {}
kinf: Config

clusters: 
- cluster:
    server: ${endpoint}
    certificate-authority-data: ${cluster_auth_base64}
  name: ${kubeconfig_name}

current-context: ${kubeconfig_name}

users:
- name: ${kubeconfig_name}
  user:
    exec:
      apiVersion: client.authentication.Kubernetes.io/v1alpha1
      command: aws-iam-authenticator
      args:
        - "token"
        - "-i"
        - "${clustername}"