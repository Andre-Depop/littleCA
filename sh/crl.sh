#!/bin/sh

source sh/common.env

openssl ca -gencrl \
    -engine pkcs11 -keyform e \
    -out crl/root-ca.crl