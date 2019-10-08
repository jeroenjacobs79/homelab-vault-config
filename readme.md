# Vault homelab setup

## Introduction

This repository contains the scripts I use to manage my lab-setup of [Hashicorp Vault](https://www.vaultproject.io). At the moment I'm using it for PKI infrastructure (for my internal servers, and OpenVPN), and I'm playing with AppRoles and Kubernetes authentication. I decided to put this on GitHub in the hope someone finds this useful for their own experiments with Vault.

**(this repository is still a work in progress)**

*Please be aware this is a homelab setup, and probably won't meet your definition of production-readiness. If you are using these scripts as a starting point for your own Vault setup, please make sure you understand everything these scripts are doing.*

## Pre-requisites

The scripts in this repository assume you already have an initialized and unsealed Vault instance. 

## Directory structure and file overview

*These scripts are quite simpel, and I recommend you take a look at them to see how they work.*

### Essential wrapper scripts and directories

* `vault_activate.sh` 

  *Usage:* `source ./vault_activate.sh`

  *Description:* Sets the `VAULT_TOKEN`, `VAULT_ADDR` and `VAULT_CACERT` environment variables, so they point to my Vault instance.


* `vault_deactivate.sh`

  *Usage:* `source ./vault_deactivate.sh`

  *Description:* Unsets the `VAULT_TOKEN`, `VAULT_ADDR` and `VAULT_CACERT` environment variables.


* `vault_unseal.sh`

  *Usage:* `./vault_unseal.sh`

  *Description:* Simple wrapper script to unseal my Vault instance.


* `secrets/`

  *Description:* This folder contains the GnuPG encrypted version of my access token and unseal key. They are referenced in the `vault_activate.sh` and `vault_unseal.sh` scripts.


* `ca/`

  *Description:* This folder contains the root cert that is used to communicate with the Vault instance. 


### Settings file

* `settings.sh`

  *Description:* This file is not called directly, but contains settings used by the various configuration scripts listed below.

### Configuration scripts

#### Vault policies

* `vault_install_policies.sh`
  
  *Usage:* `./vault_install_policies.sh`

  *Description:* Deploys all the policies in the ./policies folder to the Vault instance. Policy name is the filename minus extension.

#### OpenVPN PKI

I've set up a simple PKI infrastructure to generate TLS keypairs for my OpenVPN setup. Most of the settings are read from the `setting.sh` file, look for the OVPN_* variables.


* `ovpn_setup_pki.sh`

  *Usage:* `./ovpn_setup_pki.sh`

  *Description:* This script generates a root RSA keypair and mounts it at the configured path. You need to run this script only once.

* `ovpn_setup_roles.sh`

  *Usage:* `./ovpn_setup_roles.sh`

  *Description:* This script generates the roles that will be used to generate server and client keypairs. You can run this script as many times as you want.

* `ovpn_create_server_key.sh`

  *Usage:* `./ovpn_create_server_key.sh <name>`

  *Description:* This script generates the server keypair with the specified common name. Generating the OpenVPN config is not automated yet, so you need to copy/paste the output as necessary.

* `ovpn_create_sclient_key.sh`

  *Usage:* `./ovpn_create_client_key.sh <name>`

  *Description:* This script generates a client keypair with the specified common name. Generating the OpenVPN config is not automated yet, so you need to copy/paste the output as necessary.

#### Internal web PKI

I'm also using the PKI secret backend to issue TLS keypairs for some of my internal services, in combination with [cert-manager](https://github.com/jetstack/cert-manager). While some parts are similar to the OpenVPN PKI backend described above, there are some important differences:

- I'm defining both RSA and ECDSA intermediates.
- Intermediates are signed by a root CA key, which is kept offline.
- I'm defining 2 different roles, one called `standard-server`, and one called `secure-server` which uses shorter TTL's. That last one I'll probably use one day to rotate the keypair of Vault itself.

The first part of the setup will generate the internal intermediate CA keypairs for both RSA and ECDSA. A signing request will be saved to disk for both of them. The second part of the setup will import the signed certificates, and from then, TLS keypairs kan be issued.

Please make note of all the WEB_* variables in `settings.sh`. This is probably the most complex secret backend for now.

* `web_generate_intermediate.sh`

  *Usage:* `./web_generate_intermediate.sh`

  *Description:* Generates an intermediate CA keypair and configures 2 PKI backends (one for RSA, and one for ECDSA). Signing requests will be generated in the current folder, and will be called `ecdsa_vault_intermediate_ca.csr` and `rsa_vault_intermediate_ca.csr`.

* `web_complete_intermediate.sh`

  *Usage:* `./web_complete_intermediate.sh`

  *Description:* Before you continue, make sure you have processed the CSR file generated in the previous script and generated the certificates by your offline root CA key. You should have saved the resulting certificates as `ecdsa_vault_intermediate_ca.pem` and `rsa_vault_intermediate_ca.pem`. Once you verified all of this, you should run this script to import the certificates into Vault.

* `web_setup_roles.sh`

  *Usage:* `./web_setup_roles.sh`

  *Description:* This script will configure 2 roles for each issuer, one called `standard-server` with a relatively long TTL, and one called `secure-server` with a relatively low TTL.
 

#### Kubernetes authentication

These scripts setup Kubernetes authentication with Vault. A service account should already be created in Kubernetes that has the necessary permissions to validate JWT tokens. If you have not yet configured this necessary service account, you can customize and apply the provided `extra/k8s_vault_user.yaml` file.

Make sure the K8S_* variables in `settings.sh` are correct.


**These scripts run `kubectl` to retrieve the necessary ca certificate and the service account's JWT token. Make sure `kubectl` is configured so it connects with the correct Kubernetes cluster!**



* `k8s_setup_auth.sh`

  *Usage:* `./k8s_setup_auth.sh`

  *Description:* Retrieves the JWT token of the service account that will perform JWT validation, and uses it to configure the Vault authentication backend.

* `k8s_setup_roles.sh`

  *Usage:* `./k8s_setup_roles.sh`

  *Description:* Used to configure Kubernetes service accounts within Vault and assign policies to them. At the moment, configures a demo-role that binds a Kubernetes service account to the `default` policy.


#### AppRole authentication

Very simple scripts to enable the AppRole Auth backend and configure some roles. I used this for [cert-manager](https://github.com/jetstack/cert-manager), which does not support the Kubernetes auth backend (at least not when I last played with it, maybe this has changed now?).


* `approles_setup_auth.sh`

  *Usage:* `./approles_setup_auth.sh`

  *Description:* Just enables the AppRoles auth-backend at the path defined in the APPROLE_VAULT_PATH variable in `settings.sh`.

* `approles_setup_roles.sh`

  *Usage:* `./approles_setup_roles.sh`

  *Description:* Used to configure Kubernetes service accounts within Vault and assign policies to them. At the moment, configures a demo-role that binds a Kubernetes service account to the `default` policy.

#### AWS temporary credentials

(documentation to be done)

#### Signed SSH certificates

(documentation to be done)

