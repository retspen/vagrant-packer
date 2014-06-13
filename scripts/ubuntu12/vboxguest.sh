#!/usr/bin/env bash

apt-get -y install build-essential dkms
mkdir /tmp/virtualbox
VERSION=$(cat /home/vagrant/.vbox_version)
mount -o loop /home/vagrant/VBoxGuestAdditions_$VERSION.iso /tmp/virtualbox
sh /tmp/virtualbox/VBoxLinuxAdditions.run
# Ubuntu Fix Virtualbox 4.3.10
ln -sf /opt/VBoxGuestAdditions-$VERSION/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
umount /tmp/virtualbox
rmdir /tmp/virtualbox
rm /home/vagrant/*.iso
