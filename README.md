# docker-openvpn
openvpn in docker

to run the docker image:

```
docker run --rm \
    --name openvpn \
    --privileged \
    -v /srv/docker/openvpn/conf:/etc/openvpn \
    -p 1194:1194/udp \
    katta/openvpn
```

