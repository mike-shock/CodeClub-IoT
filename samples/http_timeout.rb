#!/usr/bin/ruby

require "net/https"
require "json"

host = "192.168.43.141"

uri = URI.parse("http://#{host}/json")
http = Net::HTTP.new(uri.host, uri.port)
http.open_timeout = 10
http.read_timeout = 10
puts 1

get_request = Net::HTTP::Get.new(uri.request_uri)
puts 2
begin
  response = http.request(get_request)
  puts 3
  text = response.body
rescue Net::OpenTimeout => e
  p e
end

