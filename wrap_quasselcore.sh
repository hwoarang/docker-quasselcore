#!/bin/bash

confdir="/var/lib/quassel"
certfile="${confdir}/quasselCert.pem"

# Create the certificate
if [[ ! -e ${certfile} ]]; then
	openssl req -x509 -nodes -days 3650 -newkey rsa:4096 \
		-keyout ${certfile} \
		-out ${certfile} \
		-batch || { echo "Failed to create the certificate"; exit 1; }
fi

params="$* --port=${QUASSEL_PORT}"

echo "Starting quasselcore with ${params}"

exec /usr/bin/quasselcore ${params}
