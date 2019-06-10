#!/bin/bash
#
# import settings
source ./settings.sh
#
# Setup approle roles
#
vault write /auth/${APPROLE_VAULT_PATH}/role/standard-server-signer policies=intern_web_signer
vault write /auth/${APPROLE_VAULT_PATH}/role/standard-server-issuer policies=intern_web_issuer
