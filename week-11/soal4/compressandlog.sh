#/bin/bash
USERS=`ls /home | xargs -r`
sudo mkdir /var/backup
for user in  $USERS; do
    sudo tar -czf /var/backup/$user.tar.gz /home/$user
    logger -s "Backup for folder ${user} is sucess"
    echo $(tail -1 /var/log/syslog) >> log.txt
done
