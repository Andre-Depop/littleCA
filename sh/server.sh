#!/bin/sh

source sh/common.env

openssl req -new \
    -config etc/server.conf \
    -out certs/$1.csr \
    -keyout certs/$1.key

openssl ca \
    -engine pkcs11 -keyform e \
    -in certs/$1.csr \
    -out certs/$1.crt \
    -extensions server_ext