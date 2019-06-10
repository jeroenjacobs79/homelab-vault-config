#!/bin/bash
#
# import settings
source ./settings.sh
#
# Setup approle auth
#
vault auth enable -path=${APPROLE_VAULT_PATH} approle
