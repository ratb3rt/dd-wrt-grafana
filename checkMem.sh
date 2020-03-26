#!/bin/sh
mem=`cat /proc/meminfo`
total=`echo "$mem" | grep ^MemTotal | awk '{print $2}'`
free=`echo "$mem" | grep ^MemFree | awk '{print $2}'`
used=`echo "$mem" | grep ^Mem: | awk '{print $3}'`
buffers=`echo "$mem" | grep ^Buffers | awk '{print $2}'`
cached=`echo "$mem" | grep ^Cached: | awk '{print $2}'`
active=`echo "$mem" | grep ^Active: | awk '{print $2}'`
inactive=`echo "$mem" | grep ^Inactive: | awk '{print $2}'`

/jffs/stats/sendInflux.sh "memory,type=total kb=$total"
/jffs/stats/sendInflux.sh "memory,type=free kb=$free"
/jffs/stats/sendInflux.sh "memory,type=used bytes=$used"
/jffs/stats/sendInflux.sh "memory,type=buffers kb=$buffers"
/jffs/stats/sendInflux.sh "memory,type=cached kb=$cached"
/jffs/stats/sendInflux.sh "memory,type=active kb=$active"
/jffs/stats/sendInflux.sh "memory,type=inactive kb=$inactive"
