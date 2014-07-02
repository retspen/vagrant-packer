#!/usr/bin/env bash

apt-get -y install php5 php5-gd php5-mysql php5-curl php5-cli php5-geoip php5-pgsql libapache2-mod-php5
a2enmod rewrite
echo 'ServerName webserv' > /etc/apache2/httpd.conf
sed -i 's/var\/www/vagrant/g' /etc/apache2/sites-enabled/000-default
cat << EOF > /usr/local/bin/a2addsite
#!/usr/bin/env python

import sys
import re

PATH = '/etc/apache2/sites-available/'
VIRTUAL_HOST = """<VirtualHost *:80>
    ServerAdmin webmaster@domain
    ServerName domain
    ServerAlias www.domain

    DocumentRoot /var/www/domain
    <Directory />
        Options FollowSymLinks
        AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/domain-error.log

    # Possible values include: debug, info, notice, warn, error, crit,
    # alert, emerg.
    LogLevel warn

    CustomLog ${APACHE_LOG_DIR}/domain-access.log combined
</VirtualHost>"""

if __name__ == '__main__':
    if len(sys.argv) == 1 or len(sys.argv) >= 3:
        print "ERROR: Input domain name for new config"
    elif '-h' in sys.argv or '--help' in sys.argv:
        print "USAGE: a2addsite donain.test"
    elif '-v' in sys.argv or '--version' in sys.argv:
        print "Version: 1.0.0 beta"
    else:
        new_virtual_host = re.sub('domain', sys.argv[1], VIRTUAL_HOST)
        file_name = PATH + sys.argv[1]
        try:
            f = open(file_name, 'w')
            f.write(new_virtual_host)
            f.close()
            print "Creating site %s." % sys.argv[1]
            print "To enable the new configuration, you need to run:"
            print "  sudo a2ensite %s" % sys.argv[1]
        except IOError as e:
            print e
EOF
chmod +x /usr/local/bin/a2addsite
