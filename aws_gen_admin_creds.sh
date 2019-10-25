#!/bin/bash
#
# import settings
source ./settings.sh
#
#
# Create temp admin creds
#
RESULT=$(vault read -format=json ${AWS_VAULT_PATH}/creds/admin)
ACCESS_KEY=$(echo $RESULT|jq -j '.data.access_key')
PRIVATE_KEY=$(echo $RESULT|jq -j '.data.secret_key')
unset RESULT
echo "[$AWS_PROFILE]"
echo aws_access_key_id=$ACCESS_KEY
echo aws_secret_access_key=$PRIVATE_KEY