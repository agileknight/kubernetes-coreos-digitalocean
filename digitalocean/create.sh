#!/bin/bash

function createVm {
	NAME=$1

	curl --request POST "https://api.digitalocean.com/v2/droplets" \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer $DIGITALOCEAN_API_KEY" \
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