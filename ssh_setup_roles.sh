#!/bin/bash
#
# import settings
source ./settings.sh
#
# create SSH CA roles
#
vault write ${SSH_CLIENT_VAULT_PATH}/roles/centos @extra/ssh_client_signer_role_centos.json