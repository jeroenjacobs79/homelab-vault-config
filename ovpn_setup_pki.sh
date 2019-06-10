#!/bin/bash
#
# import settings
source ./settings.sh
#
# create OpenVPN CA infrastructure
#
vault secrets enable -path ${OVPN_VAULT_PATH} pki
vault secrets tune -max-lease-ttl="${OVPN_MAX_TTL}" ${OVPN_VAULT_PATH}
vault write ${OVPN_VAULT_PATH}/root/generate/internal \
    common_name="${OVPN_CA_NAME}" \
    ttl="${OVPN_CA_TTL}" \
    key_bits="${OVPN_CA_KEYBITS}" \
    max_path_length=1 \
    ou="${OVPN_OU}" \
    organization="${OVPN_ORGANIZATION}" \
    country="${OVPN_COUNTRY}" \
    province="${OVPN_PROVINCE}" \
    locality="${OVPN_LOCALITY}"

