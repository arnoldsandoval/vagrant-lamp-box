#!/bin/bash

echo "Provisioning virtual machine..."

echo "Installing Git"
sudo apt-get install git -y > /dev/null

echo "Installing Apache"
sudo apt-get install apache2 -y > /dev/null

echo "Configuring Apache"
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi

echo "Updating PHP repository"
apt-get install python-software-properties build-essential -y > /dev/null
add-apt-repository ppa:ondrej/php5 -y > /dev/null
apt-get update > /dev/null

echo "Installing PHP"
sudo apt-get install php5 -y > /dev/null

echo "Installing MySQL"
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password pass'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password pass'
sudo apt-get -y install mysql-server libapache2-mod-auth-mysql php5-mysql

echo "Installing PHP Extensions"
sudo apt-get install libapache2-mod-php5 php5-curl php5-gd php5-mcrypt php5-mysql -y > /dev/null

echo "Creating MySQL database: vagrant_test"
mysql --user="root" --password="pass" --execute="CREATE DATABASE vagrant_test;"

# echo "Importing Seed data to database: vagrant_test"
# mysql -u root -ppass vagrant_test < seed.sql
