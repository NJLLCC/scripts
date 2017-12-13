#!/bin/bash

listen_path='./'
store_path='mail_reporter'
inotifywait -m -r -e modify -e move -e delete -e attrib -e create  $listen_path | while read event
do 
    echo $event 
    rsync  -vzrtopg --progress --delete -e "ssh  -i /home/cloud/.ssh/mail.pem"  --exclude 'nohup.out'  $listen_path root@172.30.51.139:~/mail_reporter_dev/
    if [ $? -eq 0 ] 
    then
        echo "sync successfully"
    else
        echo "sync failed, exit code is $?"
    fi
done
