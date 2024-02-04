#!/bin/bash

set -e

# generate rsa key
echo "Generating RSA key"
openssl genrsa -des3 -out ca.key 1024

# copy rsa key without password
echo "Copying RSA key without password"
openssl rsa -in ca.key -out ca_nopass.key

# generate cert request
echo "Generating cert request"
openssl req -new -key ca.key -config ./openssl.cnf -out ca.csr

# self-sign cert with 365 days validation
echo "Self-signing cert with 365 days validation"
openssl x509 -req -days 365 -in ca.csr -signkey ca.key -extfile ./openssl.cnf -extensions v3_ca -out ca.crt