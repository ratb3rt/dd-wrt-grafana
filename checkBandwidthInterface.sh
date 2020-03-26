#!/bin/sh
# Check /sys/class/net/ for iterfaces
#
interface="eth0 eth1 ath0 ath1 br0"
while true; do
     date="$( date +%s )"
     date
	for i in `echo $interface | sed s/" "/\\\n\/g`
	do
		rx=0
		tx=0
		rx=`cat /sys/class/net/$i/statistics/rx_bytes`
		tx=`cat /sys/class/net/$i/statistics/tx_bytes`
		/jffs/stats/sendInflux.sh "bandwidth,interface=$i,direction=rx bytes=$rx" 
		/jffs/stats/sendInflux.sh "bandwidth,interface=$i,direction=tx bytes=$tx" 
        
	done
     sleep 20
done
