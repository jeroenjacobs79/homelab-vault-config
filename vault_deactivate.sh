#!/bin/bash
#Revoke the orphan token we created during activation.
vault token revoke $VAULT_TOKEN
# unset env variables
unset VAULT_ADDR
unset VAULT_TOKEN
unset VAULT_CACERT
echo "Done."

