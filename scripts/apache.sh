#!/usr/bin/env bash

if type apt-get >/dev/null 2>&1; then
    apt-get -y install php5 php5-gd php5-mysql php5-curl php5-cli php5-geoip php5-pgsql libapache2-mod-php5
    rm -Rf /var/www
    ln -sf /vagrant /var/www
fi