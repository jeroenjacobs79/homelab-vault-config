#!/bin/bash
#
# import settings
source ./settings.sh
#
#
# set ttl stuff
#
vault write ${AWS_VAULT_PATH}/config/lease \
    lease=$AWS_LEASE \
    lease_max=$AWS_MAX_LEASE
#
# Create roles for aws credentials
#
vault write ${AWS_VAULT_PATH}/roles/admin \
    credential_type=iam_user \
    policy_document=@extra/aws_admin_user.json
