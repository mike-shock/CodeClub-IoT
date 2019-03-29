#!/bin/bash

BROKER=127.0.0.1
mosquitto_pub -h $BROKER -t "sensor/temperature" -m 25.5
