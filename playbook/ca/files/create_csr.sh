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
echo FQDN: $FQDN
export MY_IPADDR=$(nslookup $FQDN | grep Address: | awk 'NR>1 {print $2}')
echo MY_IPADDR: $MY_IPADDR
echo CSR_SUBJ: $CSR_SUBJ

WORK_HOME=$CRT_HOME/$FQDN

if [ ! -d $WORK_HOME ]; then
    mkdir -p $WORK_HOME
fi

if [ -f "${WORK_HOME}/${FQDN}.csr" ]; then
    echo "CSRは作成済みです"
    exit 1
else
    openssl genrsa -out "${WORK_HOME}/${FQDN}.key" 4096
    openssl req -sha512 -new \
        -subj $CSR_SUBJ \
        -key "${WORK_HOME}/${FQDN}.key" \
        -out "${WORK_HOME}/${FQDN}.csr" 

    cat > "${WORK_HOME}/v3.ext" <<EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1=$FQDN
DNS.2=$MY_HOST
IP.1=$MY_IPADDR
EOF
    
    cat > "${WORK_HOME}/info.txt" <<EOF
MY_HOST=${MY_HOST}
FQDN=${MY_HOST}.${MY_DOMAIN}
MY_IPADDR=${MY_IPADDR}
EOF

fi

    
