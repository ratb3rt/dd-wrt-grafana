#!/bin/sh
pingResult=`ping -c 10 91.65.15.254 | tail -2`
packet=`echo "$pingResult" |grep "packet loss" | cut -d "," -f 3 | cut -d " " -f 2| sed 's/.$//'`
gateway=`echo "$pingResult" |grep "round-trip" | cut -d "=" -f 2 | cut -d "/" -f 1|sed 's/^ *//g'`

/jffs/stats/sendInflux.sh "ping,host=gateway,type=packetloss percent=$packet"
/jffs/stats/sendInflux.sh "ping,host=gateway,type=latency ms=$gateway"