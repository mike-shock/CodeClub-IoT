#!/usr/bin/ruby

require "dht_sensor"            # подключить библиотеку
sensor = DHT11.new(23)          # создать объект sensor класса DHT11

12.times do                            # выполнить в цикле 12 раз
  sensor.read_data                     # считать показания датчика
  print "Температура: "                        # вывести температуру
  printf "%7.4f°C ",  sensor.celsius           # в градусах Цельсия
  printf "%7.4f°Ré ", sensor.reaumur              # ... Реомюра
  printf "%7.4f°F ",  sensor.fahrenheit           # ... Фаренгейта
  printf "%7.4f K ",  sensor.temperature(:kelvin) # ... Кельвина
  printf "Влажность: %f %%\n", sensor.humidity # влажность в %
  sleep 1                                      # подождать 1 секунду
end
