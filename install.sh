#!/bin/bash
git clone https://github.com/ombr/.dotfiles.git /tmp/$$
mv /tmp/$$/.git ~/
git checkout ./
git submodule init
git submodule update
