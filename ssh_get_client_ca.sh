#!/bin/bash
#
# import settings
source ./settings.sh
#
# retrieve public CA cert. 
#
vault read -field=public_key ${SSH_CLIENT_VAULT_PATH}/config/ca