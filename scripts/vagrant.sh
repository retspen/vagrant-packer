#!/usr/bin/env bash

if type apt-get >/dev/null 2>&1; then
    groupadd -r admin || true
    usermod -G vagrant,admin vagrant
    sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=(ALL) NOPASSWD:ALL/g' /etc/sudoers
    echo 'Welcome to your Vagrant-built virtual machine.' > /etc/motd.tail
fi

mkdir /home/vagrant/.ssh
wget --no-check-certificate -O authorized_keys 'https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub'
mv authorized_keys /home/vagrant/.ssh
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh
