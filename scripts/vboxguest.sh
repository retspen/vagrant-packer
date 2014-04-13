#!/usr/bin/env bash

if type apt-get >/dev/null 2>&1; then
    apt-get -y install build-essential dkms
fi

if type yum >/dev/null 2>&1; then
    yum -y install wget perl gcc kernel-devel-$(uname -r)
fi

mkdir /tmp/virtualbox
VERSION=$(cat /home/vagrant/.vbox_version)
mount -o loop /home/vagrant/VBoxGuestAdditions_$VERSION.iso /tmp/virtualbox
sh /tmp/virtualbox/VBoxLinuxAdditions.run
# Ubuntu Fix Virtualbox 4.3.10
if type apt-get >/dev/null 2>&1; then
    ln -sf /opt/VBoxGuestAdditions-$VERSION/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
fi
umount /tmp/virtualbox
rmdir /tmp/virtualbox
rm /home/vagrant/*.iso
