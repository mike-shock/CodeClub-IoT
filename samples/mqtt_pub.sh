#!/bin/bash

BROKER=10.36.254.16
mosquitto_pub -h $BROKER -t "sensor/temperature" -m 25.5
