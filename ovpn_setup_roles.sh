#!/bin/bash
#
# import settings
source ./settings.sh

#    
# create roles for server and clients
#
vault write ${OVPN_VAULT_PATH}/roles/server-role \
    max_ttl="${OVPN_MAX_SERVER_TTL}" \
    allow_any_name=true \
    server_flag=true \
    client_flag=false \
    organization="${OVPN_ORGANIZATION}" \
    ou="${OVPN_OU}" \
    country="${OVPN_COUNTRY}" \
    province="${OVPN_PROVINCE}" \
    locality="${OVPN_LOCALITY}" \
    enforce_hostnames=false
vault write ${OVPN_VAULT_PATH}/roles/client-role \
    max_ttl="$OVPN_MAX_CLIENT_TTL}" \
    allow_any_name=true \
    server_flag=false \
    client_flag=true \
    organization="${OVPN_ORGANIZATION}" \
    ou="${OVPN_OU}" \
    country="${OVPN_COUNTRY}" \
    province="${OVPN_PROVINCE}" \
    locality="${OVPN_LOCALITY}" \
    enforce_hostnames=false
