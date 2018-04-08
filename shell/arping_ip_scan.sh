#!/bin/bash

NIC_NAME="enp2s0"
IP_ADDR_PRE="192.168.10"

function signal_exit()
{
        echo "<Ctrl-c> press"
        exit
}
trap "signal_exit" TERM INT HUP

for((i=2; i<255; i++))
do
IP_ADDR=${IP_ADDR_PRE}.${i}
echo ${IP_ADDR} >> arping_ip_scan.log
arping -I ${NIC_NAME}  ${IP_ADDR} -c 2  1>&2 >> arping_ip_scan.log
done
