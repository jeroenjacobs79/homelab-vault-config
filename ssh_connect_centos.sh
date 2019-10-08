#!/bin/bash
#
# import settings
source ./settings.sh
#
# connect to server
#

ssh -i ${SSH_CLIENT_PRIVKEY} -i ${SSH_CLIENT_PUBCERT} -o IdentitiesOnly=yes centos@$1
