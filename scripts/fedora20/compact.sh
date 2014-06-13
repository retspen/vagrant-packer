#!/usr/bin/env bash

yum -y remove binutils glibc-headers glibc-devel libmpc mpfr kernel-devel kernel-headers cpp gcc perl* 
yum clean all

dd if=/dev/zero of=/junk bs=1M
rm -f /junk

sync
