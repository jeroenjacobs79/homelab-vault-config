#!/bin/bash
export VAULT_ADDR="https://vault-01.internal.headincloud.be"
export VAULT_TOKEN=$(gpg --decrypt ./secrets/token.gpg)
export VAULT_CACERT=$(pwd)/ca/ecdsa_root_ca.pem
#create new token with root permissions but limited lifetime
export VAULT_TOKEN=$(vault token create -policy=root -format=json -explicit-max-ttl=8h -ttl=1h -orphan=true|jq -j '.auth.client_token')
echo "Vault environment has been set."

