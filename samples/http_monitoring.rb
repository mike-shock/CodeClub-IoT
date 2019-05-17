#!/usr/bin/ruby

require "net/https"
require "json"

host = "localhost"
uri = URI.parse("http://#{host}:8000")
http = Net::HTTP.new(uri.host, uri.port)

temperatures = []
times = []

while true do
  get_request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(get_request)
  text = response.body

  hash = JSON.parse(text)
  temperatures << hash["Sensors"][0]["Temperature"]
  times << Time.now.strftime("%H:%M:%S")
  File.open("chart_data.js", "w") do |f|
    f.printf "temp_set=%s;\n", temperatures.to_s
    f.printf "label_set=%s;\n", times.to_s
  end
  sleep 5
end
