#!/bin/bash
echo "Must be root for that ;-)"

apt-get install python-software-properties
apt-add-repository ppa:cloudfoundry/ppa
apt-get update
apt-get install cloudfoundry-server

