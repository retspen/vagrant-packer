#!/usr/bin/env bash

yum -y remove glibc-headers glibc-devel libgomp mpfr cloog-ppl ppl kernel-devel kernel-headers wget cpp gcc perl* 
yum clean all

rm /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules

dd if=/dev/zero of=/junk bs=1M
rm -f /junk

sync
