#!/usr/bin/ruby

require "dht_sensor"            # подключить библиотеку для DHTxx

class MeteoStation # v.4
  attr :sensor_th              # объявить атрибут «датчик»
  attr :temperature            # объявить атрибут «температура»
  attr :temperature, :humidity # объявить атрибуты «влажность»
  attr :pause                  # объявить атрибуты «задержка» (в секундах)

  def initialize(pause=60)
    @sensor_th = DHT11.new(23) # создать объект sensor класса DHT11
    @pause = pause
    self.measure
  end

  def measure
    @sensor_th.read_data             
    @temperature = @sensor_th.celsius  
    @humidity    = @sensor_th.humidity
    return [@temperature,@humidity]
  end

  def values_as_string
    @temperature.to_s+" "+@humidity.to_s
  end

  def start
    self.log("Начало работы")
    self.work
  end

  def work
    while true do
      self.measure
      self.log(values_as_string)
      sleep @pause
    end
  end

  def log(message)
    timestamp = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    printf("%s %s\n", timestamp, message)
  end
end

meteo = MeteoStation.new(10)
meteo.start
