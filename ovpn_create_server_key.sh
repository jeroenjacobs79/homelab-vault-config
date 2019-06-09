#!/bin/bash
#
# import settings
source ./settings.sh
#
# create OpenVPN server key. This will spit out the private key, key certificate, and ca certificate which can be used in your OpenVPN config file.
# Note to self: Should check consul-template to auto-renew the server key and cert.
#
vault write ${OVPN_VAULT_PATH}/issue/server-role \
    common_name="${OVPN_SERVER_NAME}" \
    ttl="${OVPN_SERVER_TTL}"