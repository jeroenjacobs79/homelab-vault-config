#!/bin/bash
#
# This script will write/update all policies in the "policies" subfolder to the Vault instance. Name of the policy is deducted from the filename (minus extension).
#
for filename in ./policies/*.hcl; do
  vault policy write $(basename $filename .hcl) $filename
done
