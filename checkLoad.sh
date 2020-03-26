#!/bin/sh
load=`cat /proc/loadavg`
load1=`echo "$load" | awk '{print $1}'`
load5=`echo "$load" | awk '{print $2}'`
load15=`echo "$load" | awk '{print $3}'`
proc_run=`echo "$load" | awk '{print $4}' | awk -F '/' '{print $1}'`
proc_total=`echo "$load" | awk '{print $4}' | awk -F '/' '{print $2}'`

/jffs/stats/sendInflux.sh "cpuload,type=load_one value=$load1"
/jffs/stats/sendInflux.sh "cpuload,type=load_five value=$load5"
/jffs/stats/sendInflux.sh "cpuload,type=load_fifteen value=$load15"
/jffs/stats/sendInflux.sh "cpuload,type=proc_run value=$proc_run"
/jffs/stats/sendInflux.sh "cpuload,type=proc_total value=$proc_total"
