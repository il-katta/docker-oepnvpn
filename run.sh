#!/bin/sh
docker run --rm \
    --name openvpn \
    --privileged \
    -v /srv/docker/openvpn/conf:/etc/openvpn \
    -p 1194:1194/udp \
    katta/openvpn:client-certs