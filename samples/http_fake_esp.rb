#!/usr/bin/ruby

require 'json'
require 'socket'                   # классы TCPSocket, TCPServer

server = TCPServer.new 8000        # новый TCPServer на порту 8000

started = Time.now
while session = server.accept      # сервер начинает сеанс
  request = session.gets           # сервер получает запрос клиента
                                   # 
  temperature = rand(10..20)
  humidity = rand(25..85)
  pressure = rand(760..780)
  hash = {"System": {
          "Name":"ESP_Fake","Unit":-1,"Build":20000,"Git Build":"v2.0-20180218","Local time": Time.now.strftime("%Y-%m-%d %H:%M:%S"),"Uptime": (Time.now-started).to_i,"Free RAM":12345},
          "Sensors":[
            {"TaskName":"T_P_H", "Temperature": temperature, "Pressure": pressure, "Humidity": humidity},
            {"TaskName":"Screen"},
            {"TaskName":"PN532", "Tag": 0.00}
          ]
         }
  puts request                     # "GET / HTTP/1.1\r\n"
                                   # сервер формирует ответ:
  session.print "HTTP/1.1 200\r\n"                           # код возврата
  session.print "Content-Type: text/json; charset=utf-8\r\n" # тип ответа
  session.print "\r\n"                                       # разделитель
  session.print hash.to_json                                 # ответ
  session.close                    # сервер заканчивает сеанс
end

# {"System":{"Name":"ESP_Easy","Unit":4,"Build":20000,"Git Build":"v2.0-20180218","Local time":"2019-05-16 23:23:00","Uptime":12,"Free RAM":17376},"Sensors":[{"TaskName":"T_P_H","Temperature":26.07,"Humidity":34.19,"Pressure":753.59},{"TaskName":"Screen"},{"TaskName":"PN532","Tag":0.0}]}
