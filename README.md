# Simple WordPress Vagrant
Install a vagrant with LEMP stack (Linux, nginx, Mysql, PHP).
It also installs Node.js, Gulp and Grunt task runners.

For more advanced WordPress Vagrant stuff you can take a look at [VVV](https://github.com/Varying-Vagrant-Vagrants/VVV) or [Vagrantpress](http://vagrantpress.org/).

## Instructions
When you have vagrant installed and working do the following:

* cd to the vagrant folder and type ```vagrant up```.
* Wait a long time while everything gets installed.
* When everything is finished you have a LEMP stack with WordPress 3.9.1 and Grunt/Gulp installed.

## Login details
MySql-user: root, MySql-password: vagrant

Your site is now available at 10.0.1.42

If you want to change the ip you access your site, change this line:
```config.vm.network "private_network", ip: "10.0.1.42"```
in ```vagrant/Vagrantfile```.

## Everything that gets installed

* nginx
* php5-fpm
* mysql-server, mysql-client
* git
* php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcached
* php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-xcache
* WordPress 3.9.1
* Node.js
* Gulp
* Grunt
