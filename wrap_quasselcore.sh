#!/bin/bash

quassel_conf="/var/lib/quasselcore"

# Create the certificate
openssl req -x509 -nodes -days 3650 -newkey rsa:4096 \
	-keyout ${quassel_conf}/quasselCert.pem \
	-out ${quassel_conf}/quasselCert.pem \
	-batch || { echo "Failed to create the certificate"; exit 1; }

chown -R quassel:quassel ${quassel_conf}/quasselCert.pem

params="$* --port=${QUASSEL_PORT}"

echo "Starting quasselcore with ${params}"

exec /usr/bin/quasselcore ${params}
