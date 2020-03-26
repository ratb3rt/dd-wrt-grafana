#!/bin/sh
connections=`cat /proc/net/nf_conntrack`
tcp=`echo "$connections" | grep ipv4 | grep tcp | wc -l`
udp=`echo "$connections" | grep ipv4 | grep udp | wc -l`
icmp=`echo "$connections" | grep ipv4 | grep icmp | wc -l`
total=`echo "$connections" | grep ipv4 | wc -l`
/jffs/stats/sendInflux.sh "connections,protocol=tcp value=$tcp"
/jffs/stats/sendInflux.sh "connections,protocol=udp value=$udp"
/jffs/stats/sendInflux.sh "connections,protocol=icmp value=$icmp"
/jffs/stats/sendInflux.sh "connections,protocol=all value=$total"
