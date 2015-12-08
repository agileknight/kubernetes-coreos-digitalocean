#/bin/bash

# needed for digital-ocean.py
export DO_API_TOKEN=$DIGITALOCEAN_API_KEY

# needed for terraform-digitalocean provider
export DIGITALOCEAN_TOKEN=$DIGITALOCEAN_API_KEY
export TF_VAR_do_ssh_key_id=$SSH_KEY_ID

bash