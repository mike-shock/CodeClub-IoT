#!/usr/bin/ruby
# https://github.com/njh/ruby-mqtt

#require 'rubygems'
require 'mqtt'

BROKER = '127.0.0.1'

MQTT::Client.connect(BROKER) do |client|
  client.publish('sensor/temperature', '25.5')
end
