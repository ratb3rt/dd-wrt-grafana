# dd-wrt-grafana

Scripts to display metrics from WRT 1900AC router running DD-WRT.

Enable JFFS support
 * Internal Flash Storage

Upload these shell scripts to /jffs/stats
 - Modify IP and Port of your graphite server
 - Modify any interfaces you wish to ignore

Add the following under Additional Cron Jobs:
* * * * * root /jffs/stats/collector.sh > /dev/null 2>&1
* * * * * root /jffs/stats/sleep20.sh > /dev/null 2>&1
* * * * * root /jffs/stats/sleep40.sh > /dev/null 2>&1

Add the following script to the router Startup:

/jffs/stats/checkBandwidthInterface.sh &

Paste below into the commands window and select "Run Command"

/jffs/stats/checkBandwidthInterface.sh &

Import Grafana json dashbaord.

Enjoy.
