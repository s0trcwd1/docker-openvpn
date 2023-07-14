FROM alpine:edge

MAINTAINER Martin van Beurden <chadoe@gmail.com>

COPY ./bin /usr/local/bin

RUN apk add --no-cache bash openvpn=2.6.5-r0 easy-rsa git openssl iptables && \
    ln -s /usr/share/easy-rsa/easyrsa /usr/local/bin

# Needed by scripts
ENV OPENVPN=/etc/openvpn \
    EASYRSA=/usr/share/easy-rsa \
    EASYRSA_PKI=/etc/openvpn/pki \
    EASYRSA_VARS_FILE=/etc/openvpn/vars

VOLUME ["/etc/openvpn"]

EXPOSE 1194/udp

WORKDIR /etc/openvpn
CMD ["startopenvpn"]

