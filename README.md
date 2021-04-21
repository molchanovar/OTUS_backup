# OTUS_backup
backup_lab

### Настраиваем бэкапы

Настроить стенд Vagrant с двумя виртуальными машинами: backup_server и client

Настроить удаленный бекап каталога /etc c сервера client при помощи borgbackup. Резервные копии должны соответствовать следующим критериям:

    Директория для резервных копий /var/backup. Это должна быть отдельная точка монтирования. В данном случае для демонстрации размер не принципиален, достаточно будет и 2GB.
    Репозиторий дле резервных копий должен быть зашифрован ключом или паролем - на ваше усмотрение
    Имя бекапа должно содержать информацию о времени снятия бекапа
    Глубина бекапа должна быть год, хранить можно по последней копии на конец месяца, кроме последних трех. Последние три месяца должны содержать копии на каждый день. Т.е. должна быть правильно настроена политика удаления старых бэкапов
    Резервная копия снимается каждые 5 минут. Такой частый запуск в целях демонстрации.
    Написан скрипт для снятия резервных копий. Скрипт запускается из соответствующей Cron джобы, либо systemd timer-а - на ваше усмотрение.


### Выполнение: 
`script.sh` - скрипт создание диска и точки монтирования `/var/backup`

1. Установка borg на клиенте и сервере: 


