#! /bin/bash

#Задаем переменную окружения Borg
export BORG_PASSPHRASE="borg"
REPOSITORY="borg@server:/var/backup/borg"

# Бэкап каталога /etc.
echo "Copy files to server"
borg create -v --stats $REPOSITORY::'Backup-{now:%Y-%m-%d@%H:%M}' /etc

# По ТЗ - глубина бекапа год, храним по последней копии на конец месяца, кроме последних трех. Последние три месяца содержат копии на каждый день.
echo "Clean old files" 
borg prune -v $REPOSITORY --prefix 'Backup-' --list --keep-daily=90 --keep-monthly=9 --keep-yearly 1

#Вывод информации о содержимом репозитория
echo "Backups list"
borg list $REPOSITORY
