#!/bin/bash

BROKER=10.36.254.16
mosquitto_sub -h $BROKER -t "sensor/temperature"
