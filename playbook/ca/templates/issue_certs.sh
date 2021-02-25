#!/bin/bash

export MY_DOMAIN=labo.local

#
export MY_HOST=ca
export FQDN=$MY_HOST.$MY_DOMAIN
export CSR_SUBJ="/C=JP/ST=Tokyo//O=HomeLabo/CN=$FQDN"
./create_csr.sh
./signature_cert.sh


export MY_HOST=harbor
export FQDN=$MY_HOST.$MY_DOMAIN
export CSR_SUBJ="/C=JP/ST=Tokyo/O=HomeLabo/CN=$FQDN"
./create_csr.sh
./signature_cert.sh


export MY_HOST=gitlab
export FQDN=$MY_HOST.$MY_DOMAIN
export CSR_SUBJ="/C=JP/ST=Tokyo/O=HomeLabo/CN=$FQDN"
./create_csr.sh
./signature_cert.sh


export MY_HOST=jenkins
export FQDN=$MY_HOST.$MY_DOMAIN
export CSR_SUBJ="/C=JP/ST=Tokyo/O=HomeLabo/CN=$FQDN"
./create_csr.sh
./signature_cert.sh


