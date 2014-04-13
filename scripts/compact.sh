#!/usr/bin/env bash

if type apt-get >/dev/null 2>&1; then
    apt-get -y remove build-essential make dkms libgomp1 libmpfr4 libquadmath0 libmpc2 binutils libc-dev-bin linux-libc-dev libc6-dev cpp gcc libdpkg-perl dpkg-dev fakeroot libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl manpages-dev
    apt-get -y autoremove
    apt-get clean
    rm -f /var/lib/dhcp3/*
fi

if type yum >/dev/null 2>&1; then
    yum -y remove glibc-headers glibc-devel libgomp mpfr cloog-ppl ppl kernel-devel kernel-headers glibc-devel wget cpp gcc perl* 
    yum clean all
fi

rm /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules

dd if=/dev/zero of=/junk bs=1M
rm -f /junk

sync
