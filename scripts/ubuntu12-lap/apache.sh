#!/usr/bin/env bash

apt-get -y install php5 php5-gd php5-mysql php5-curl php5-cli php5-geoip php5-pgsql libapache2-mod-php5
a2enmod rewrite
cat << EOF > /etc/apache2/sites-available/default
<VirtualHost *:80>
        ServerAdmin webmaster@ubuntu
        ServerName 192.168.33.10

        DocumentRoot /var/www   
        <Directory />
                Options FollowSymLinks
                AllowOverride All
        </Directory>
        <Directory /var/www>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride None
                Order allow,deny
                allow from all
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/error.log

        # Possible values include: debug, info, notice, warn, error, crit,
        # alert, emerg.
        LogLevel warn

        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

rm -Rf /var/www
ln -sf /vagrant /var/www