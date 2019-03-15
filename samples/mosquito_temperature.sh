#!/bin/bash
while true
do
 temperature=`cat /sys/class/thermal/thermal_zone0/temp`
 degree=$((temperature/1000))
 fraction=$((temperature%1000))
 `mosquitto_pub -h localhost -t "sensor/temperature" -m $degree.$fraction`
  sleep 1
done
