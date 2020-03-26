#!/bin/sh
sleep 20
/jffs/stats/checkConnections.sh &
/jffs/stats/pingGateway.sh &
/jffs/stats/pingGoogle.sh &
/jffs/stats/pingLab.sh &
/jffs/stats/checkLoad.sh &
/jffs/stats/checkCPUTemp.sh &
/jffs/stats/checkMem.sh &
/jffs/stats/checkCPU.sh &
/jffs/stats/checkWirelessClients.sh &
