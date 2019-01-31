#!/usr/bin/ruby

require "dht_sensor"            # подключить библиотеку для DHTxx

class MeteoStation # v.3
  attr :sensor_th              # объявить атрибут «датчик»
  attr :temperature            # объявить атрибут «температура»
  attr :temperature, :humidity # объявить атрибуты «влажность»

  def initialize
    @sensor_th = DHT11.new(23) # создать объект sensor класса DHT11
    self.measure
  end

  def measure
    @sensor_th.read_data             
    @temperature = @sensor_th.celsius  
    @humidity    = @sensor_th.humidity
    return [@temperature,@humidity]
  end

  def values_as_string
    (temperature, humidity) = measure
    temperature.to_s+" "+humidity.to_s
  end

  def start
    log("Начало работы")
    log(values_as_string)
  end

  def log(message)
    timestamp = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    printf("%s %s\n", timestamp, message)
  end
end

meteo = MeteoStation.new
meteo.start
