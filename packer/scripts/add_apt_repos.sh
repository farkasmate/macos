#!/bin/bash

ARCH=$(dpkg --print-architecture)

# docker
curl -fsSL "https://download.docker.com/linux/ubuntu/gpg" | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg
echo "deb [arch=${ARCH}] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list

# yubico
curl -fsSL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3653e21064b19d134466702e43d5c49532cba1a9" | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/yubico.gpg
echo "deb http://ppa.launchpad.net/yubico/stable/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/yubico.list
