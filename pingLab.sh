#!/bin/sh
pingResult=`ping -c 10 192.168.0.16 | tail -2`
packet=`echo "$pingResult" |grep "packet loss" | cut -d "," -f 3 | cut -d " " -f 2| sed 's/.$//'`
gateway=`echo "$pingResult" |grep "round-trip" | cut -d "=" -f 2 | cut -d "/" -f 1|sed 's/^ *//g'`

/jffs/stats/sendInflux.sh "ping,host=piserver,type=packetloss percent=$packet"
/jffs/stats/sendInflux.sh "ping,host=piserver,type=latency ms=$gateway"