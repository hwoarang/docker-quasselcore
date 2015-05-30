# Summary
Docker image files to create an Arch Linux Quassel core with SSL support.

# Configuration

## Environmental variables
The following environmental variables are being used by the image and you should
set them appropriately when you define your container.

* QUASSEL_PORT: Listening port for Quassel Server

# Putting everything together

## Building the image
Build it like this (or something similar)

	docker build -t hwoarang/docker-quasselcore .

## Creating a container

	docker run -d --name "quasselcore" -p 4242:4242 hwoarang/docker-quasselcore
