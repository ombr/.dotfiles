#!/bin/bash
git config --global user.name "Luc Boissaye"
git config --global user.email luc@boissaye.fr
git init ./
git remote add origin $1
git pull origin master
