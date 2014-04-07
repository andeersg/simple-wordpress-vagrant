#!/usr/bin/env bash

sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password vagrant'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password vagrant'

sudo apt-get update

echo "Start install"

sudo apt-get install mysql-server mysql-client -y

sudo apt-get install git-core -y

sudo apt-get install nginx -y

sudo apt-get install php5-fpm -y

sed -i -e 's/127.0.0.1:9000/\/tmp\/php5-fpm.sock/g' /etc/php5/fpm/pool.d/www.conf

sudo service php5-fpm restart

sudo apt-get install php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcached php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-xcache -y

sudo service php5-fpm restart

yes | cp /vagrant/default /etc/nginx/sites-available

sudo service nginx restart

echo "Finished with LEMP stack"

# Download WordPress.
rm -rf /wordpress/*
git clone https://github.com/WordPress/WordPress.git /wordpress
cd /wordpress
git checkout 3.8.1

rm -rf .git

echo "CREATE DATABASE wordpress; GRANT ALL ON wordpress.* TO 'root'@'localhost' IDENTIFIED BY 'vagrant';" | mysql -uroot -pvagrant

cd /wordpress

cp -n wp-config-sample.php wp-config.php

DBUSER=$"username_here"
DBPASS=$"password_here"
DBNAME=$"database_name_here"
sed -i -e "s/${DBUSER}/root/g" wp-config.php
sed -i -e "s/${DBPASS}/vagrant/g" wp-config.php
sed -i -e "s/${DBNAME}/wordpress/g" wp-config.php

echo "Finished with WordPress"
echo http://localhost:8090/wp-admin/install.php

# Add Node.js repo.
sudo apt-get install python-software-properties -y
sudo apt-add-repository ppa:chris-lea/node.js -y
sudo apt-get update

sudo apt-get install nodejs -y

sudo npm install -g gulp -y
sudo npm install -g grunt-cli -y

echo "Installed Node.js, Grunt and Gulp."