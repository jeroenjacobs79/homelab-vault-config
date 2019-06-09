#!/bin/bash
export VAULT_ADDR="https://vault-01.internal.headincloud.be"
export VAULT_TOKEN=$(gpg --decrypt ./secrets/token.pgp)
export VAULT_CACERT=$(pwd)/ca/ecdsa_root_ca.pem
echo "Vault environment has been set."

