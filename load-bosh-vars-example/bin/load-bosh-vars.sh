#!/bin/bash
rm -rf jumpbox.key
if [ ! -z "$jumpbox_ssh_key" ]; then
	echo "${jumpbox_ssh_key}" > jumpbox.key
	chmod 0400 jumpbox.key
fi
export BOSH_HOST="$target"
echo "${ca_cert}" > ca.crt
bosh alias-env $BOSH_HOST -e $BOSH_HOST --ca-cert ca.crt
export BOSH_ENVIRONMENT=$BOSH_HOST
export BOSH_CLIENT="$client"
export BOSH_CLIENT_SECRET="$client_secret"
if [ ! -z "$jumpbox_ssh_key" ]; then
	export BOSH_ALL_PROXY=ssh+socks5://jumpbox@${BOSH_ENVIRONMENT}:22?private-key=jumpbox.key
fi
