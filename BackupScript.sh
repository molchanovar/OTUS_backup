#! /bin/bash

#Переменные окружения Borg
export BORG_PASSPHRASE="borg"
REPOSITORY="borg@borgserver:/var/backup/borg"

# Бэкап каталога /etc.
echo "Copy files to server"
borg create -v --stats $REPOSITORY::'Backup-{now:%Y-%m-%d@%H:%M}' /etc

# Удаление лишних бэкапов. Глубина бекапа год, храним по последней копии на конец месяца, кроме последних трех. Последние три месяца содержат копии на каждый день.
echo "Clean old files" 
borg prune -v $REPOSITORY --prefix 'Backup-' --list --keep-daily=90 --keep-monthly=9 --keep-yearly 1

#Добавим вывод информации о репозитории
echo "Backups list"
borg list $REPOSITORY