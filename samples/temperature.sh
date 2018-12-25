#!/bin/bash
while true
do
 temp=`cat /sys/class/thermal/thermal_zone0/temp`
  echo Температура: $temp
  if [ $temp -ge 40000 ]
   then
    echo Перегрев!
  fi
  sleep 1
done  	