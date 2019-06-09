#!/bin/bash
#
# import settings
source ./settings.sh
#
# Setup Kubernetes auth
#
# Retrieve token from sa that isued for JWT validation
K8S_SECRET_NAME=$(kubectl -n default get serviceaccount ${K8S_VAULT_SA_NAME} -n ${K8S_VAULT_SA_NAMESPACE} -o jsonpath='{.secrets[0].name}')
K8S_VAULT_ACCOUNT_TOKEN=$(kubectl get secret ${K8S_SECRET_NAME} -n ${K8S_VAULT_SA_NAMESPACE} -o jsonpath='{.data.token}' | base64 --decode)
K8S_VAULT_CA=$(kubectl get secret ${K8S_SECRET_NAME} --namespace ${K8S_VAULT_SA_NAMESPACE} -o jsonpath='{.data.ca\.crt}' | base64 --decode)
#
# Enable K8S authentication and configure it
vault auth enable -path "${K8S_VAULT_PATH}" kubernetes
vault write -f auth/${K8S_VAULT_PATH}/config \
    kubernetes_host="${K8S_API_URL}" \
    kubernetes_ca_cert="${K8S_VAULT_CA}" \
    token_reviewer_jwt="${K8S_VAULT_ACCOUNT_TOKEN}"
