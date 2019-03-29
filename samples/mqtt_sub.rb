#!/usr/bin/ruby
# https://github.com/njh/ruby-mqtt
require 'mqtt'

BROKER = '127.0.0.1'
PORT=1883
# Subscribe example
MQTT::Client.connect(BROKER, PORT) do |client|
  client.subscribe('sensor/temperature')
  topic, message = client.get
  puts "#{topic}: #{message}"
end
