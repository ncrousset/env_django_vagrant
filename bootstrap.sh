#!/usr/bin/env bash
# sudo add-apt-repository ppa:ubuntu-toolchain-r/ppa
apt-get update && sudo apt-get upgrade

apt-get install -y software-properties-common
add-apt-repository ppa:deadsnakes/ppa

apt-get update

# Force a blank root password for mysql
sudo apt-get install debconf-utils -y
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password 1234"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password 1234"

apt-get install -y nmon
apt-get install -y nginx
apt-get install -q -y -f mysql-server
apt-get install -y python3.8

apt-get install -y python3-pip


# apt-get install install -y python3-pip

update-alternatives --remove python3 /usr/bin/python3.4
update-alternatives --install /usr/bin/python3  python3 /usr/bin/python3.8 1

python3 -m pip install --user --upgrade pip
python3 -m pip install Django

service mysql restart
service nginx start

# if ! [ -L /var/www ]; then

# rm -rf /var/www

# ln -fs /Users/ncrousset/Vagrant /var/www

# fi