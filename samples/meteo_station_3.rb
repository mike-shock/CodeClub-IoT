#!/usr/bin/ruby

require "dht_sensor"            # подключить библиотеку для DHTxx

class MeteoStation # v.2
  attr :sensor_th              # объявить атрибут «датчик»
  attr :temperature            # объявить атрибут «температура»
  attr :temperature, :humidity # объявить атрибуты «влажность»

  def initialize
    @sensor_th = DHT11.new(23) # создать объект sensor класса DHT11
    @sensor_th.read_data       # считать показания датчика
    @temperature = @sensor_th.celsius
    @humidity = @sensor_th.humidity
  end

  def start
    log("Начало работы")
    log(@temperature.to_s+" "+@humidity.to_s)
  end

  def log(message)
    timestamp = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    printf("%s %s\n", timestamp, message)
  end
end

meteo = MeteoStation.new
meteo.start
