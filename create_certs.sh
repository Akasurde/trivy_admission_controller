#!/bin/bash

echo "Creating certificates"
mkdir -p certs/ca

openssl genrsa -out certs/ca/ca.key 2048

openssl req -new -key certs/ca/ca.key -out certs/ca/ca.csr
openssl x509 -req -in certs/ca/ca.csr -out certs/ca/ca-cert.crt -signkey certs/ca/ca.key -days "3650"
openssl genrsa -out certs/server.key 2048
openssl req -new -key certs/server.key -out certs/server.csr -subj "/CN=$(hostname)"
hostname=$(hostname)
openssl x509 -req -extfile <(printf "subjectAltName=DNS:$hostname") -in certs/server.csr -signkey certs/server.key -out certs/server.crt -CA certs/ca/ca-cert.crt -CAkey certs/ca/ca.key -days 3650 -CAcreateserial
