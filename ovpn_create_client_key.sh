#!/bin/bash
#
# import settings
source ./settings.sh
#
# create OpenVPN client key. CN should be specified as a commandline parameter. This will spit out the private key, key certificate, and ca certificate which can be used in your OpenVPN config file.
#
# Examples:
#
# ./ovpn_create_client_key "Jeroen iphone"
# ./ovpn_create_client_key "Jeroen ipad"
# ./ovpn_create_client_key "Jeroen macbook"
#
vault write ${OVPN_VAULT_PATH}/issue/client-role \
    common_name="$1" \
    ttl="${OVPN_CLIENT_TTL}"