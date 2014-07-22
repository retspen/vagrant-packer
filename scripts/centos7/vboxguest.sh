#!/usr/bin/env bash

yum -y --disablerepo=\* --enablerepo=base install bzip2 wget perl gcc kernel-devel-$(uname -r)
mkdir /tmp/virtualbox
VERSION=$(cat /home/vagrant/.vbox_version)
mount -o loop /home/vagrant/VBoxGuestAdditions_$VERSION.iso /tmp/virtualbox
sh /tmp/virtualbox/VBoxLinuxAdditions.run
umount /tmp/virtualbox
rmdir /tmp/virtualbox
rm /home/vagrant/*.iso
