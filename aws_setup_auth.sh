#!/bin/bash
#
# import settings
source ./settings.sh
#
# Config AWS credentials and rotate
#
vault secrets enable -path=${AWS_VAULT_PATH} aws
# load initial aws key from disk. First line is access key, second line is secret access key
AWS_INITIAL_CREDS=$(gpg --decrypt secrets/aws_initial_creds.gpg)
vault write ${AWS_VAULT_PATH}/config/root \
    access_key=$(echo "$AWS_INITIAL_CREDS"|head -n 1|tr -d '\n') \
    secret_key=$(echo "$AWS_INITIAL_CREDS"|head -n 2|tail -n 1|tr -d '\n') \
    region=${AWS_REGION}
unset AWS_INITIAL_CREDS
 # Rotate credentials, so Vault is the only one who knows the secret key. Use -force since no data is expected.
vault write -force /${AWS_VAULT_PATH}/config/rotate-root   
# IAM credentials are eventually consistent. Delay for 15 seconds for AWS to catch up.
echo "Waiting 15 seconds for IAM eventual consistency..."
sleep 15