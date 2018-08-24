# docker-openvpn
openvpn in docker

to run the docker image:

```bash
docker run --rm \
    --name openvpn \
    --cap-add=NET_ADMIN \
    -e REMOTE_ADDRESS=my.vpn.server.com \
    -v /srv/docker/openvpn/conf:/conf \
    -v /srv/docker/openvpn/certs:/certs \
    -p 1194:1194/udp \
    katta/openvpn:client-certs
```

to generate the client configuration:

```bash
docker exec -ti openvpn ovpn_new_client client_name
```

Now you can find client configuration in `/srv/docker/openvpn/conf/clients` folder