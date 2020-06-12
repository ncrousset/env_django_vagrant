#!/usr/bin/env bash

apt-get update

apt-get install -y nmon

apt-get install -y nginx


service nginx start

if ! [ -L /var/www ]; then

rm -rf /var/www

ln -fs /Users/ncrousset/Vagrant /var/www

fi