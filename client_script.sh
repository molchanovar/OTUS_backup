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

# Инициализация репозитория с бэкапами
export BORG_PASSPHRASE="borg"
borg init --encryption=repokey borg@server:/var/backup/borg
cp /vagrant/BackupScript.sh /opt
sudo chmod +x /opt/BackupScript.sh
echo "*/5 * * * * sudo runuser -l borg -c /opt/BackupScript.sh > /dev/null 2>&1" >> /etc/crontab
