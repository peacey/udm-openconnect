FROM arm64v8/debian:testing-slim

ARG DEBIAN_FRONTEND=noninteractive

COPY stretch-backports.list /etc/apt/sources.list.d/
RUN apt update && apt -y upgrade && \
    apt install -y --no-install-recommends openconnect ca-certificates procps psmisc iproute2 ipset conntrack && \
    apt install -y --no-install-recommends --allow-downgrades iptables/stretch-backports && \
    apt clean

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

CMD openconnect --help
