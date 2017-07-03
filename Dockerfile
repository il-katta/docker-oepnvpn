FROM debian:9
RUN set -x && \
    apt-get update -q && \
    apt-get install -qy openvpn iptables curl && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*
    
ADD ./bin /bin
VOLUME /etc/openvpn
EXPOSE 1194/udp
CMD /bin/run
