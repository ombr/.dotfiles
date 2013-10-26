#!/bin/bash
git clone https://github.com/ombr/.dotfiles.git /tmp/$$
mv /tmp/$$/.git ~/
git checkout ./
rm ~/install.sh
