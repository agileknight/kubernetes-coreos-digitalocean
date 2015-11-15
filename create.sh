#!/bin/bash

# copy .env.default to .env and fill in missing values
source .env

function createVm {
	NAME=$1

	curl --request POST "https://api.digitalocean.com/v2/droplets" \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer $TOKEN" \
     --data '{"region":"'"${REGION}"'",
        "image":"coreos-beta",
	"private_networking":true,
        "size":"'"$SIZE"'",
        "user_data": "'"$(cat cloud-config)"'",
        "ssh_keys":["'"$SSH_KEY_ID"'"],
        "name":"'"${NAME}"'"}'
}

createVm 'kube-master'
createVm 'kube-slave01'
createVm 'kube-slave02'