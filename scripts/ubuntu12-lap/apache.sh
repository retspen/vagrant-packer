#!/usr/bin/env bash

apt-get -y install php5 php5-gd php5-mysql php5-curl php5-cli php5-geoip php5-pgsql libapache2-mod-php5
a2enmod rewrite
sed -i 's/var\/www/vagrant/g' /etc/apache2/sites-enabled/000-default
