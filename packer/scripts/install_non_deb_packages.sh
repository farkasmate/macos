#!/bin/bash

source ~/.profile

# aws-vault
curl --location https://github.com/99designs/aws-vault/releases/download/v6.6.0/aws-vault-linux-amd64 --output "${HOME}/bin/aws-vault"
chmod a+x "${HOME}/bin/aws-vault"

# python
pyenv install
pip install pipenv

# ruby
source /etc/profile.d/rvm.sh
rvm install $(cat ~/.ruby-version)

# whalebrew
curl --location https://github.com/whalebrew/whalebrew/releases/download/0.4.0/whalebrew-Linux-x86_64 --output /tmp/whalebrew
chmod a+x /tmp/whalebrew
PATH=/tmp:${PATH} WHALEENV_AUTO_INSTALL=true whaleenv install $(cat ~/.whalebrew/version)
rm /tmp/whalebrew
