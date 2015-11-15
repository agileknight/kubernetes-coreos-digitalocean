#/bin/bash

kubectl config set-cluster default-cluster \
  --server=https://${MASTER_HOST} \
  --certificate-authority=/opt/certs/ca.pem
kubectl config set-credentials default-admin \
  --certificate-authority=/opt/certs/ca.pem \
  --client-key=/opt/certs/admin-key.pem \
  --client-certificate=/opt/certs/admin.pem
kubectl config set-context default-system \
  --cluster=default-cluster \
  --user=default-admin
kubectl config use-context default-system