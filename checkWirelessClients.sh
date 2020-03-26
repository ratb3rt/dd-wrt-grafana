#!/bin/sh
ath0=`wl_atheros -i ath0 assoclist | wc -l`
ath1=`wl_atheros -i ath1 assoclist | wc -l`

/jffs/stats/sendInflux.sh "clients,interface=ath0 value=$ath0"
/jffs/stats/sendInflux.sh "clients,interface=ath1 value=$ath1"