#!/bin/bash
vault write pki-web-intern-ecdsa/intermediate/set-signed certificate=@ecdsa_vault_intermediate_ca.pem
vault write pki-web-intern-rsa/intermediate/set-signed certificate=@rsa_vault_intermediate_ca.pem
