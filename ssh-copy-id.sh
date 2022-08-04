#!/bin/sh

HOST=$1

if [[ $# -le 0  ]];then
	echo 'Usage: ./ssh-copy-id.sh HOST@IP '
	exit 1
fi

echo "Your case number:"
echo "1: To opnwrt"
echo "2: To linux"


read OPTION

echo 'Copying public key to destination node...'


case $OPTION in
	1) 
		ssh ${HOST} "tee -a /etc/dropbear/authorized_keys" < ~/.ssh/id_rsa.pub
	;;
	2)
		ssh ${HOST} "tee -a ~/.ssh/authorized_keys" < ~/.ssh/id_rsa.pub
	;;
esac


echo ''

echo 'Try ssh to destination node'
