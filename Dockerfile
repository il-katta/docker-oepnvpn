FROM debian:9
ARG APT_PROXY
RUN set -x && \
    [ -z "$APT_PROXY" ] || \
        /bin/echo -e "Acquire::HTTP::Proxy \"$APT_PROXY\";\nAcquire::HTTPS::Proxy \"$APT_PROXY\";\nAcquire::http::Pipeline-Depth \"23\";" > \
            /etc/apt/apt.conf.d/01proxy


RUN set -x && \
    apt-get update -q && \
    apt-get install -qy openvpn iptables curl && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*
    
ADD ./bin /bin
RUN chmod +x /bin/*
VOLUME /etc/openvpn
EXPOSE 1194/udp
CMD /bin/run
