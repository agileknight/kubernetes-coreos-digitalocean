#!/bin/bash

function createVm {
	NAME=$1

    echo "creating vm: $NAME"

	curl --request POST "https://api.digitalocean.com/v2/droplets" \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer $DIGITALOCEAN_API_KEY" \
     --data '{"region":"'"${REGION}"'",
        "image":"coreos-beta",
	"private_networking":true,
        "size":"'"$SIZE"'",
        "user_data": "'"$(cat cloud-config.mo | mo)"'",
        "ssh_keys":["'"$SSH_KEY_ID"'"],
        "name":"'"${NAME}"'"}'
}

function createCluster {
    ETCD_DISCOVERY_URL=$(curl https://discovery.etcd.io/new?size=3)
    echo "using fresh etcd discovery url: $ETCD_DISCOVERY_URL"

    createVm 'kube-master'
    createVm 'kube-slave01'
    createVm 'kube-slave02'
}

createCluster

