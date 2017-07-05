#!/bin/sh
docker run --rm \
    --name openvpn \
    --cap-add=NET_ADMIN \
    -v /srv/docker/openvpn/conf:/conf \
    -v /srv/docker/openvpn/certs:/certs \
    -p 1194:1194/udp \
    katta/openvpn:client-certs