#!/bin/bash
. environment
cp  "$CA_HOME/ca.crt" "$CRT_HOME/ca.pem"
chmod a+r "$CRT_HOME/ca.pem"
openssl x509 -text -fingerprint -noout -in "$CRT_HOME/ca.pem" >  "$CRT_HOME/ca_pem.txt"

