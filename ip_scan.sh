#!/bin/bash




for ip in 192.168.1.{1..255};
do
    (
    ping -c 3 $ip &> /dev/null
    if [ $? -eq 0 ]; 
    then
        echo $ip 
    fi
    )&
done
wait

