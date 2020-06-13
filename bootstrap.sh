#!/usr/bin/env bash

apt-get update

# Force a blank root password for mysql
sudo apt-get install debconf-utils -y
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password 1234"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password 1234"

apt-get install -y nmon
apt-get install -y nginx
apt-get install -q -y -f mysql-server



service mysql restart
service nginx start

if ! [ -L /var/www ]; then

rm -rf /var/www

ln -fs /Users/ncrousset/Vagrant /var/www

fi