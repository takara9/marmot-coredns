#!/bin/bash

export MY_DOMAIN=labo.local

#
export MY_HOST=ca
export FQDN=$MY_HOST.$MY_DOMAIN
export CSR_SUBJ="/C=JP/ST=Tokyo/OU=CA/O=Home Labo/CN=$FQDN"
export V3EXT=v3ext_ca.txt
./create_csr.sh
./signature_cert.sh


export MY_HOST=harbor
export FQDN=$MY_HOST.$MY_DOMAIN
export CSR_SUBJ="/C=JP/ST=Tokyo/OU=Repository Service/O=Home Labo/CN=$FQDN"
export V3EXT=v3ext_harbor.txt
./create_csr.sh
./signature_cert.sh


export MY_HOST=gitlab
export FQDN=$MY_HOST.$MY_DOMAIN
export CSR_SUBJ="/C=JP/ST=Tokyo/OU=Repository Service/O=Home Labo/CN=$FQDN"
export V3EXT=v3ext_gitlab.txt
./create_csr.sh
./signature_cert.sh


export MY_HOST=jenkins
export FQDN=$MY_HOST.$MY_DOMAIN
export CSR_SUBJ="/C=JP/ST=Tokyo/OU=Software Development/O=Home Labo/CN=$FQDN"
export V3EXT=v3ext_jenkins.txt
./create_csr.sh
./signature_cert.sh


export MY_HOST=ldap
export FQDN=$MY_HOST.$MY_DOMAIN
export CSR_SUBJ="/C=JP/ST=Tokyo/OU=Directory Service/O=Home Labo/CN=$FQDN"
export V3EXT=v3ext_ldap.txt
./create_csr.sh
./signature_cert.sh


export MY_HOST=sso
export FQDN=$MY_HOST.$MY_DOMAIN
export CSR_SUBJ="/C=JP/ST=Tokyo/OU=Directory Service/O=Home Labo/CN=$FQDN"
export V3EXT=v3ext_sso.txt
./create_csr_noip.sh
./signature_cert.sh


