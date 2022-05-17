#!/bin/bash

# docker
curl -fsSL "https://download.docker.com/linux/ubuntu/gpg" | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# indeed
curl -fsSL "https://indeed.sch.bme.hu/apt/indeed.key" | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/indeed.gpg
echo "deb https://indeed.sch.bme.hu/apt/ /" | sudo tee /etc/apt/sources.list.d/indeed.list > /dev/null

# keybase
curl -fsSL "https://keybase.io/docs/server_security/code_signing_key.asc" | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/keybase.gpg
echo "deb http://prerelease.keybase.io/deb stable main" | sudo tee /etc/apt/sources.list.d/keybase.list > /dev/null

# rvm
curl -fsSL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x7be3e5681146fd4f1a40eda28094bb14f4e3fbbe" | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/rvm.gpg
echo "deb http://ppa.launchpad.net/rael-gc/rvm/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/rvm.list > /dev/null

# yubico
curl -fsSL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3653e21064b19d134466702e43d5c49532cba1a9" | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/yubico.gpg
echo "deb http://ppa.launchpad.net/yubico/stable/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/yubico.list > /dev/null
