#!/bin/bash
#
# Setup approle auth
#
# Still need to figure out how to automate this more easily
#
vault auth -path=hic-approle approle

vault write /auth/hic-approle/role/standard-server-signer policies=intern_web_signer
vault write /auth/hic-approle/role/standard-server-issuer policies=intern_web_issuer
