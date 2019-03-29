#!/bin/bash

BROKER=127.0.0.1
mosquitto_sub -h $BROKER -t "sensor/temperature"
