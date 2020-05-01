#!/bin/sh
export INFLUX_HOST=192.168.0.148
/jffs/stats/checkBandwidthInterface.sh &
/jffs/stats/checkConnections.sh &
/jffs/stats/checkCPU.sh &
/jffs/stats/checkCPUTemp.sh &
/jffs/stats/checkLoad.sh &
/jffs/stats/checkMem.sh &
/jffs/stats/checkWirelessClients.sh &
/jffs/stats/pingLab.sh &
/jffs/stats/pingGoogle.sh &
/jffs/stats/pingGateway.sh &
