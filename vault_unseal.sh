#!/bin/bash
#
# Just unseals the Vault
#
vault operator unseal $(gpg --decrypt ./secrets/unseal.gpg) 
