#!/bin/bash
#
# import settings
source ./settings.sh
#
# create temporary SSH cert
#
vault write -field=signed_key ${SSH_CLIENT_VAULT_PATH}/sign/centos valid_principals="centos" public_key=@${SSH_CLIENT_PUBKEY} > ${SSH_CLIENT_PUBCERT}