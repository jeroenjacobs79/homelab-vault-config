#!/bin/bash
#
# import settings
source ./settings.sh
#
#
# Create roles for service accounts. This is just a demo role for now...
#
vault write auth/${K8S_VAULT_PATH}/role/demo \
    bound_service_account_names=${K8S_VAULT_SA_NAME} \
    bound_service_account_namespaces=${K8S_VAULT_SA_NAMESPACE} \
    policies=default \
    ttl=1h
