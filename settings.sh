
# Web PKI settings. I'm creating both RSA and ECDSA keys with it.

WEB_RSA_VAULT_PATH="pki-web-intern-rsa"
WEB_RSA_MAX_TTL="87600h"
WEB_RSA_CA_KEYBITS="2048"
WEB_RSA_SERVER_KEYBITS="2048"
WEB_RSA_CA_TTL="87600h"
WEB_RSA_ORGANIZATION="Head In Cloud BVBA"
WEB_RSA_OU="Internal Services"
WEB_RSA_COUNTRY="BE"
WEB_RSA_PROVINCE="Antwerp"
WEB_RSA_LOCALITY="Hemiksem"
WEB_RSA_CA_NAME="Head In Cloud BVBA Intermediate RSA Vault CA2"

WEB_EC_VAULT_PATH="pki-web-intern-ecdsa"
WEB_EC_MAX_TTL="87600h"
WEB_EC_CA_KEYBITS="256"
WEB_EC_SERVER_KEYBITS="256"
WEB_EC_CA_TTL="87600h"
WEB_EC_ORGANIZATION="Head In Cloud BVBA"
WEB_EC_OU="Internal Services"
WEB_EC_COUNTRY="BE"
WEB_EC_PROVINCE="Antwerp"
WEB_EC_LOCALITY="Hemiksem"
WEB_EC_CA_NAME="Head In Cloud BVBA Intermediate ECDSA Vault CA2"

WEB_ROLE_STANDARD_NAME="standard-server"
WEB_ROLE_STANDARD_MAX_TTL="43800h"
WEB_ROLE_STANDARD_TTL="744h"
WEB_ROLE_STANDARD_ALLOW_SUBDOMAINS="true"
WEB_ROLE_STANDARD_ALLOWED_DOMAINS="internal.headincloud.be"

WEB_ROLE_SECURE_NAME="secure-server"
WEB_ROLE_SECURE_MAX_TTL="168h"
WEB_ROLE_SECURE_TTL="24h"
WEB_ROLE_SECURE_ALLOW_SUBDOMAINS="true"
WEB_ROLE_SECURE_ALLOWED_DOMAINS="internal.headincloud.be"

# Settings for Kubernetes authentication setup

K8S_VAULT_PATH="kubernetes"
#K8S_API_URL="https://kubernetes.default"
K8S_API_URL="https://104.199.102.187"
K8S_VAULT_SA_NAME="vault-auth"
K8S_VAULT_SA_NAMESPACE="kube-security"

# AppRole settings
APPROLE_VAULT_PATH="approle"

# OpenVPN TLS settings
OVPN_VAULT_PATH="pki-ovpn"
OVPN_ORGANIZATION="Head In Cloud BVBA"
OVPN_OU="VPN Services"
OVPN_LOCALITY="Hemiksem"
OVPN_PROVINCE="Antwerp"
OVPN_COUNTRY="BE"
OVPN_CA_NAME="Head In Cloud VPN Root CA"
OVPN_MAX_TTL="87600h"
OVPN_CA_TTL="87600h"
OVPN_CA_KEYBITS="4096"
OVPN_SERVER_NAME="OpenVPN server"
OVPN_MAX_SERVER_TTL="87600h"
OVPN_SERVER_TTL="43800h"
OVPN_MAX_CLIENT_TTL="87600h"
OVPN_CLIENT_TTL="43800h"

# SSH CA settings
SSH_CLIENT_VAULT_PATH="ssh-client-signer"
SSH_CLIENT_STANDARD="standard-user"
SSH_CLIENT_PUBKEY="$HOME/.ssh/datacenter-hic-deploy.pub"
SSH_CLIENT_PRIVKEY="$HOME/.ssh/datacenter-hic-deploy"
SSH_CLIENT_PUBCERT="$HOME/.ssh/datacenter-hic-deploy-cert.pub"

# AWS secrets settings
AWS_VAULT_PATH="aws"
AWS_REGION="eu-west-1"
AWS_LEASE="8h"
AWS_MAX_LEASE="24h"