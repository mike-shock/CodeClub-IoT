#!/usr/bin/ruby
# https://github.com/njh/ruby-mqtt
require 'mqtt'

BROKER = '10.36.254.16'
PORT=1883
# Subscribe example
MQTT::Client.connect(BROKER, PORT) do |client|
  client.subscribe('sensor/temperature')
  topic, message = client.get
  puts "#{topic}: #{message}"
end
