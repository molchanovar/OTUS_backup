#! /bin/bash

sudo yum -y install parted
sudo parted -s /dev/sdb mklabel gpt
sudo parted /dev/sdb mkpart primary ext4 0% 100%
sudo mkfs.ext4 /dev/sdb1
mkdir /var/backup
sudo mount /dev/sdb1 /var/backup
cat /etc/mtab | grep /dev/sdb >> /etc/fstab