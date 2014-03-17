install
url --url http://mirrors.kernel.org/centos/6.5/os/i386/

lang en_US.UTF-8
keyboard us
network --onboot no --device eth0 --bootproto dhcp --noipv6
rootpw --plaintext r00tme
firewall --service=ssh
authconfig --enableshadow --passalgo=sha512
selinux --enforcing
timezone --utc America/New_York
bootloader --location=mbr --driveorder=sda --append="crashkernel=auto rhgb quiet"
clearpart --all --initlabel
autopart
zerombr
skipx
text
reboot

%packages --nobase
@core
wget
bzip2
perl
-aic94xx-firmware
-b43-openfwwf
-bfa-firmware
-iwl100-firmware
-iwl1000-firmware
-iwl5150-firmware
-iwl6000-firmware
-iwl6000g2a-firmware
-iwl6050-firmware
-iwl5000-firmware
-ivtv-firmware
-atmel-firmware
-iwl4965-firmware
-iwl3945-firmware
-rt73usb-firmware
-ql23xx-firmware
-ql2400-firmware
-ql2100-firmware
-ql2500-firmware
-zd1211-firmware
-rt61pci-firmware
-ql2200-firmware
-ipw2100-firmware
-ipw2200-firmware
-libertas-usb8388-firmware
-xorg-x11-drv-ati-firmware
%end

%post
/usr/sbin/groupadd vagrant
/usr/sbin/useradd vagrant -g vagrant -G wheel
echo "vagrant"|passwd --stdin vagrant
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
