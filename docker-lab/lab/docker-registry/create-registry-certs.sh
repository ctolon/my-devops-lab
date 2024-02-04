#!/bin/bash
# Bash Script to create a self-signed certificate for the docker registry

set -e

DNS="docker-registry.devops"

openssl req \
 -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key \
 -addext "subjectAltName = DNS:docker-registry.devops" \
 -x509 -days 365 -out certs/domain.crt

# openssl req -new -newkey rsa:2048 -nodes -keyout certs/registry.newmind.ml.key -out certs/registry.newmind.ml.csr
# openssl x509 -req -days 365 -in certs/registry.newmind.ml.csr -signkey certs/registry.newmind.ml.key -out certs/registry.newmind.ml.crt
