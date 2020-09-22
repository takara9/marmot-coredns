#!/bin/bash
##
## 証明書 署名
##
. environment

WORK_HOME=$CRT_HOME/$MY_DOMAIN
. "$WORK_HOME/info.txt"

echo "サーバー証明書 署名"
echo MY_DOMAIN: $MY_DOMAIN


if [ -f "${WORK_HOME}/${MY_DOMAIN}.crt" ]; then
    echo "証明書は作成済みです"
    exit 1
else
    openssl x509 -req -sha512 -days 3650 \
        -extfile "${WORK_HOME}/v3.ext" \
        -CA "${CA_HOME}/ca.crt" -CAkey "${CA_HOME}/ca.key" -CAcreateserial \
        -in "${WORK_HOME}/${MY_DOMAIN}.csr" \
        -out "${WORK_HOME}/${MY_DOMAIN}.crt"
fi
