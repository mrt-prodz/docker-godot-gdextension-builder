FROM debian:trixie-slim

WORKDIR /mnt

ARG MINGW_VERSION=12.2.0-14+25.2
ARG MINGW_BINUTIL_VERSION=2.41-4+11+nmu1
ARG SCONS_VERSION=4.5.2+dfsg-1

SHELL [ "/bin/bash", "-c" ]

RUN set -ex \
    \
    && DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get upgrade --no-install-recommends -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    \
    g++-mingw-w64-x86-64=${MINGW_VERSION} \
    build-essential \
    binutils-mingw-w64=${MINGW_BINUTIL_VERSION} \
    python3 \
    scons=${SCONS_VERSION} \
    \
    && apt-get autoremove --purge -y \
    && apt-get clean
