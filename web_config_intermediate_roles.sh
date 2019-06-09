#!/bin/bash
#
# import settings
source ./settings.sh
#
# Standard server roles
#
# ECDSA
#
vault write ${WEB_EC_VAULT_PATH}/roles/${WEB_ROLE_STANDARD_NAME} \
    max_ttl="${WEB_ROLE_STANDARD_MAX_TTL}" \
    ttl="${WEB_ROLE_STANDARD_TTL}" \
    allowed_domains="${WEB_ROLE_STANDARD_ALLOWED_DOMAINS}" \
    allow_subdomains="${WEB_ROLE_STANDARD_ALLOW_SUBDOMAINS}" \
    key_type=ec \
    key_bits="${WEB_EC_SERVER_KEYBITS}" \
    country="${WEB_EC_COUNTRY}" \
    province="${WEB_EC_PROVINCE}" \
    locality="${WEB_EC_LOCALITY}" \
    organization="${WEB_EC_ORGANIZATION}" \
    ou="${WEB_EC_OU}" \
    generate_lease=true
#
# RSA
#
vault write pki-web-intern-rsa/roles/${WEB_ROLE_STANDARD_NAME} \
    max_ttl="${WEB_ROLE_STANDARD_MAX_TTL}" \
    ttl="${WEB_ROLE_STANDARD_TTL}" \
    allowed_domains="${WEB_ROLE_STANDARD_ALLOWED_DOMAINS}" \
    allow_subdomains="${WEB_ROLE_STANDARD_ALLOW_SUBDOMAINS}" \
    key_type=rsa \
    key_bits="${WEB_RSA_SERVER_KEYBITS}" \
    country="${WEB_RSA_COUNTRY}" \
    province="${WEB_RSA_PROVINCE}" \
    locality="${WEB_RSA_LOCALITY}" \
    organization="${WEB_RSA_ORGANIZATION}" \
    ou="${WEB_RSA_OU}" \
    generate_lease=true
#
# Role with shorter TTL's for secure servers
#
# ECDSA
#
vault write ${WEB_EC_VAULT_PATH}/roles/${WEB_ROLE_SECURE_NAME} \
    max_ttl="${WEB_ROLE_SECURE_MAX_TTL}" \
    ttl="${WEB_ROLE_SECURE_TTL}" \
    allowed_domains="${WEB_ROLE_SECURE_ALLOWED_DOMAINS}" \
    allow_subdomains="${WEB_ROLE_SECURE_ALLOW_SUBDOMAINS}" \
    key_type=ec \
    key_bits="${WEB_EC_SERVER_KEYBITS}" \
    country="${WEB_EC_COUNTRY}" \
    province="${WEB_EC_PROVINCE}" \
    locality="${WEB_EC_LOCALITY}" \
    organization="${WEB_EC_ORGANIZATION}" \
    ou="${WEB_EC_OU}" \
    generate_lease=true
#
# RSA
#
vault write pki-web-intern-rsa/roles/${WEB_ROLE_SECURE_NAME} \
    max_ttl="${WEB_ROLE_SECURE_MAX_TTL}" \
    ttl="${WEB_ROLE_SECURE_TTL}" \
    allowed_domains="${WEB_ROLE_SECURE_ALLOWED_DOMAINS}" \
    allow_subdomains="${WEB_ROLE_SECURE_ALLOW_SUBDOMAINS}" \
    key_type=rsa \
    key_bits="${WEB_RSA_SERVER_KEYBITS}" \
    country="${WEB_RSA_COUNTRY}" \
    province="${WEB_RSA_PROVINCE}" \
    locality="${WEB_RSA_LOCALITY}" \
    organization="${WEB_RSA_ORGANIZATION}" \
    ou="${WEB_RSA_OU}" \
    generate_lease=true
