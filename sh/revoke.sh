#!/bin/sh

source sh/common.env

openssl ca \
    -engine pkcs11 -keyform e \
    -revoke ca/root-ca/$1.pem \
    -crl_reason $2