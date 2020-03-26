#!/bin/sh
cpu=`cat /proc/stat | head -n1 | sed 's/cpu //'`
user=`echo $cpu | awk '{print $1}'`
nice=`echo $cpu | awk '{print $2}'`
system=`echo $cpu | awk '{print $3}'`
idle=`echo $cpu | awk '{print $4}'`
iowait=`echo $cpu | awk '{print $5}'`
irq=`echo $cpu | awk '{print $6}'`
softirq=`echo $cpu | awk '{print $7}'`
steal=`echo $cpu | awk '{print $8}'`
guest=`echo $cpu | awk '{print $9}'`
guest_nice=`echo $cpu | awk '{print $10}'`

/jffs/stats/sendInflux.sh "cpu,stat=user value=$user"
/jffs/stats/sendInflux.sh "cpu,stat=nice value=$nice"
/jffs/stats/sendInflux.sh "cpu,stat=system value=$system"
/jffs/stats/sendInflux.sh "cpu,stat=idle value=$idle"
/jffs/stats/sendInflux.sh "cpu,stat=iowait value=$iowait"
/jffs/stats/sendInflux.sh "cpu,stat=irq value=$irq"
/jffs/stats/sendInflux.sh "cpu,stat=softirq value=$softirq"
/jffs/stats/sendInflux.sh "cpu,stat=steal value=$steal"
/jffs/stats/sendInflux.sh "cpu,stat=guest value=$guest"
/jffs/stats/sendInflux.sh "cpu,stat=guest_nice value=$guest_nice"
