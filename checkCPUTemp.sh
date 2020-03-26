#!/bin/sh
cpuTemp=`awk "BEGIN {print $(cat /sys/class/i2c-dev/i2c-0/device/0-004c/hwmon/hwmon1/subsystem/hwmon1/temp1_input)/1000; exit}"`
wl0Temp=`awk "BEGIN {print $(cat /sys/class/i2c-dev/i2c-0/device/0-004c/hwmon/hwmon1/temp1_input)/1000; exit}"`
wl1Temp=`awk "BEGIN {print $(cat /sys/class/i2c-dev/i2c-0/device/0-004c/hwmon/hwmon1/temp2_input)/1000; exit}"`

/jffs/stats/sendInflux.sh "cputemp,source=cpu temp=$cpuTemp"
/jffs/stats/sendInflux.sh "cputemp,source=wl0 temp=$wl0Temp"
/jffs/stats/sendInflux.sh "cputemp,source=wl1 temp=$wl1Temp"