#!/bin/sh

HOST=$1

if [[ $# -le 0  ]];then
	echo 'Usage: ./ssh-copy-id.sh HOST@IP'
	exit 1
fi

echo 'Copying public key to destination node...'


ssh ${HOST} "tee -a ~/.ssh/authorized_keys" < ~/.ssh/id_rsa.pub

echo ''

echo 'Try ssh to destination node'
