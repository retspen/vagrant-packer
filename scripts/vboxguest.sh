#!/usr/bin/env bash

if type apt-get >/dev/null 2>&1; then
    apt-get -y install build-essential dkms linux-headers-$(uname -r)
fi

if type yum >/dev/null 2>&1; then
    yum -y install gcc kernel-devel-$(uname -r)
fi

mkdir /tmp/virtualbox
VERSION=$(cat /home/vagrant/.vbox_version)
mount -o loop /home/vagrant/VBoxGuestAdditions_$VERSION.iso /tmp/virtualbox
sh /tmp/virtualbox/VBoxLinuxAdditions.run
umount /tmp/virtualbox
rmdir /tmp/virtualbox
rm /home/vagrant/*.iso
