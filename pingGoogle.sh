#!/bin/sh
pingResult=`ping -c 10 www.google.com | tail -2`
packet=`echo "$pingResult" |grep "packet loss" | cut -d "," -f 3 | cut -d " " -f 2| sed 's/.$//'`
gateway=`echo "$pingResult" |grep "round-trip" | cut -d "=" -f 2 | cut -d "/" -f 1|sed 's/^ *//g'`

/jffs/stats/sendInflux.sh "ping,host=google,type=packetloss percent=$packet"
/jffs/stats/sendInflux.sh "ping,host=google,type=latency ms=$gateway"