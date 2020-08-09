#!/bin/bash


export MY_HOST=ca
export MY_DOMAIN=$MY_HOST.labs.local
export MY_IPADDR="192.168.1.254"
export CSR_SUBJ="/C=JP/ST=Tokyo/L=Hongo/OU=Labo/O=Takara/CN=$MY_DOMAIN"
./create_csr.sh
./signature_cert.sh


export MY_HOST=harbor
export MY_DOMAIN=$MY_HOST.labs.local
export MY_IPADDR="192.168.1.71"
export CSR_SUBJ="/C=JP/ST=Tokyo/L=Hongo/OU=Labo/O=Takara/CN=$MY_DOMAIN"
./create_csr.sh
./signature_cert.sh


export MY_HOST=gitlab
export MY_DOMAIN=$MY_HOST.labs.local
export MY_IPADDR="192.168.1.73"
export CSR_SUBJ="/C=JP/ST=Tokyo/L=Hongo/OU=Labo/O=Takara/CN=$MY_DOMAIN"
./create_csr.sh
./signature_cert.sh


export MY_HOST=jenkins
export MY_DOMAIN=$MY_HOST.labs.local
export MY_IPADDR="192.168.1.85"
export CSR_SUBJ="/C=JP/ST=Tokyo/L=Hongo/OU=Labo/O=Takara/CN=$MY_DOMAIN"
./create_csr.sh
./signature_cert.sh


