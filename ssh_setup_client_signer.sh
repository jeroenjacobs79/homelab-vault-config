#!/bin/bash
#
# import settings
source ./settings.sh
#
# create SSH CA infrastructure
#
vault secrets enable -path ${SSH_CLIENT_VAULT_PATH} ssh
vault write ${SSH_CLIENT_VAULT_PATH}/config/ca generate_signing_key=true