#!/bin/bash

ssh-keyscan github.com >> ~/.ssh/known_hosts

cd ~
git init
git remote add origin git@github.com:farkasmate/dotfiles.git
git fetch origin
git checkout -b master --track origin/master
