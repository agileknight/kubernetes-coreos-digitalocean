#!/bin/bash

function destroyVm {
	NAME=$1

    echo "destroying vm: $NAME"

	doctl d d $NAME
}

function destroyCluster {
    destroyVm 'kube-master'
    destroyVm 'kube-slave01'
    destroyVm 'kube-slave02'
}

destroyCluster

