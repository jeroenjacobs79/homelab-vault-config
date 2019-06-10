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

  *Description:* This file is not called directly, but contains settings used by the various configuration scripts listed below

### Configuration scripts

(to be continued)

