#!/bin/bash
#
# import settings
source ./settings.sh
#
# This will configure both a RSA and ECDSA intermediate PKI backend. CSR's are generated and saved to disk, and those should be signed by your root CA.
# After signing, you can use ./web_complete_intermediate.sh script to import the certificates.
#
# ECDSA CA configuration
#
vault secrets enable -path "${WEB_EC_VAULT_PATH}" pki
vault secrets tune -max-lease-ttl="${WEB_EC_MAX_TTL}" "${WEB_EC_VAULT_PATH}"
vault write -field=csr ${WEB_EC_VAULT_PATH}/intermediate/generate/internal \
    common_name="${WEB_EC_CA_NAME}" \
    ttl="${WEB_EC_CA_TTL}" \
    key_type=ec \
    key_bits="${WEB_EC_CA_KEYBITS}" \
    max_path_length=1 \
    organization="${WEB_EC_CA_ORGANIZATION}" \
    ou="${WEB_EC_OU}" \
    country="${WEB_EC_COUNTRY}" \
    province="${WEB_EC_PROVINCE}" \
    locality="${WEB_EC_LOCALITY}" \
    > ecdsa_vault_intermediate_ca.csr
echo "csr saved as ecdsa_vault_intermediate_ca.csr."
echo "please save signed certificate as ecdsa_vault_intermediate_ca.pem"
#
# RSA CA configuration
#
vault secrets enable -path "${WEB_RSA_VAULT_PATH}" pki
vault secrets tune -max-lease-ttl="${WEB_RSA_MAX_TTL}" "${WEB_RSA_VAULT_PATH}"
vault write -field=csr ${WEB_RSA_VAULT_PATH}/intermediate/generate/internal \
    common_name="${WEB_RSA_CA_NAME}" \
    ttl="${WEB_RSA_CA_TTL}" \
    key_type=rsa \
    key_bits="${WEB_RSA_CA_KEYBITS}" \
    max_path_length=1 \
    organization="${WEB_RSA_CA_ORGANIZATION}" \
    ou="${WEB_RSA_OU}" \
    country="${WEB_RSA_COUNTRY}" \
    province="${WEB_RSA_PROVINCE}" \
    locality="${WEB_RSA_LOCALITY}" \
    > rsa_vault_intermediate_ca.csr
echo "csr saved as rsa_vault_intermediate_ca.csr."
echo "please save signed certificate as rsa_vault_intermediate_ca.pem"
