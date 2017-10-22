#!/bin/sh

source sh/common.env

rm -rf ca crl certs

mkdir -p ca/root-ca/db crl certs

touch ca/root-ca/db/root-ca.db ca/root-ca/db/root-ca.db.attr

echo 01 > ca/root-ca/db/root-ca.crt.srl
echo 01 > ca/root-ca/db/root-ca.crl.srl

openssl req -new \
    -engine pkcs11 -key 3 -keyform e \
    -out ca/root-ca.csr \
    -days 3650

openssl ca -selfsign \
    -engine pkcs11 -keyform e \
    -in ca/root-ca.csr \
    -out ca/root-ca.crt \
    -extensions root_ca_ext