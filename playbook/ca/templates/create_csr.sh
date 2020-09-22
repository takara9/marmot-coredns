#!/bin/bash

. environment

##
## 認証局　自己署名証明書 作成
##
# CN  URLのFQDN      例 www.yahoo.co.jp
# OU  組織単位名     例 Technical Division
# O   会社や団体名   例 ACME Japan Co.,Ltd.
# L   市区町村名     例 Nihonbash,Hakozaki-cho,Chuo-ku
# ST  都道府県名     例 Tokyo
# C   国             例 JP


##
## 証明書署名要求(CSR) 作成
##
echo 証明書署名要求（CSR）作成
echo MY_HOST: $MY_HOST
echo MY_DOMAIN: $MY_DOMAIN
echo MY_IPADDR: $MY_IPADDR
echo CSR_SUBJ: $CSR_SUBJ

WORK_HOME=$CRT_HOME/$MY_DOMAIN

if [ ! -d $WORK_HOME ]; then
    mkdir -p $WORK_HOME
fi

if [ -f "${WORK_HOME}/${MY_DOMAIN}.csr" ]; then
    echo "CSRは作成済みです"
    exit 1
else
    openssl genrsa -out "${WORK_HOME}/${MY_DOMAIN}.key" 4096
    openssl req -sha512 -new \
        -subj $CSR_SUBJ \
        -key "${WORK_HOME}/${MY_DOMAIN}.key" \
        -out "${WORK_HOME}/${MY_DOMAIN}.csr" 

    cat > "${WORK_HOME}/v3.ext" <<EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1=$MY_DOMAIN
DNS.2=$MY_HOST
IP.1=$MY_IPADDR
EOF
    
    cat > "${WORK_HOME}/info.txt" <<EOF
MY_HOST=${MY_HOST}
MY_DOMAIN=${MY_HOST}.labs.local
MY_IPADDR=${MY_IPADDR}
EOF

fi

    
