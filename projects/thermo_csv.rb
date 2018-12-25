#!/usr/bin/ruby

require "thermal_sensor"

  sensor = RaspberryPi::ThermalSensor.new

  sensor.read_data
  printf("%s,%s,%7.4f\n", 
      Time.now.strftime("%Y-%m-%d"),
      Time.now.strftime("%H:%M:%S"),
      sensor.celsius)
