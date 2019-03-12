#!/usr/bin/ruby

require 'socket'

require 'socket'                   # классы TCPSocket, TCPServer

server = TCPServer.new 5000        # новый TCPServer на порту 5000

while session = server.accept      # сервер начинает сеанс
  request = session.gets           # сервер получает запрос клиента
                                   # запрос надо обработать!
  puts request                     # "GET / HTTP/1.1\r\n"
                                   # сервер формирует ответ:
  session.print "HTTP/1.1 200\r\n"             # код возврата
  session.print "Content-Type: text/plain; charset=utf-8\r\n" # тип ответа
  session.print "\r\n"                         # разделитель
  session.print "Текущее время #{Time.now}"    # ответ
  session.close                    # сервер заканчивает сеанс
end

