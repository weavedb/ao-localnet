#!/bin/sh

cd $(dirname $0)

# Mint/grant tokens
cd  node ../wallets/printWalletAddresses.mjs | while read -r line; do
	address=$(echo $line | awk '{print $1}')
	curl -q http://localhost:4000/mint/$address/1000000000000
done

#########################################################################################
# Publish the 'Scheduler-Location' record

./publish-scheduler-location.mjs
./mine.mjs

#########################################################################################
# Publish the `aos` Module

./publish-aos-module.mjs
echo "copy this   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo
./mine.mjs
