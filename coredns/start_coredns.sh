#!/bin/bash

docker run -d --name coredns \
       --restart=always \
       --volume=/coredns/:/root/ \
       -p 53:53/udp \
       coredns/coredns \
       -conf /root/Corefile
