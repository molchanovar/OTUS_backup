#! /bin/bash

sudo yum -y install epel-release
sudo yum -y install borgbackup
sudo yum -y install vim
sudo useradd -m borg
cp /vagrant/hosts /etc/
sudo cp /vagrant/id_rsa /home/borg/.ssh/
sudo cp /vagrant/id_rsa.pub /home/borg/.ssh/
# sudo mkdir /var/backup
# sudo chmod 700 /var/backup
# sudo chown borg:borg /var/backup
borg init --encryption=repokey borg@server:/var/backup/borg --stdin borg
cp /vagrant/BackupScript.sh /opt
sudo chmod +x /opt/BackupScript.sh
echo "*/5 * * * * /opt/BackupScript.sh > /dev/null 2>&1" >> /etc/crontab
