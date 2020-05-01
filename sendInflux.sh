#!/bin/sh
curl -i -XPOST http://$INFLUX_HOST:8086/write?db=routerstats --data-binary "$@"
