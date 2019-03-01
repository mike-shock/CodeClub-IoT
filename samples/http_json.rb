#!/usr/bin/ruby

require "net/https"
require "json"

host = "192.168.43.141"

uri = URI.parse("http://#{host}/json")
http = Net::HTTP.new(uri.host, uri.port)

get_request = Net::HTTP::Get.new(uri.request_uri)
response = http.request(get_request)
text = response.body

hash1 = JSON.parse(text)
p hash1
p hash1["Sensors"][0]["Pressure"]
puts

hash2 = eval(text)
p hash2
p hash2[:Sensors][0][:Pressure]



