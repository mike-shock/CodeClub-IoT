#!/usr/bin/ruby

require "thermal_sensor"

sensor = RaspberryPi::ThermalSensor.new # создать объект sensor класса ThermalSensor

(1..12).each do |n|                     # повторить 12 раз
  sensor.read_data                      # считать показания встроенного датчика
  printf("Дата:%s. Время: %s. Температура: %7.4f°C \n", # напечатать
    Time.now.strftime("%d.%m.%Y"),      # дату (ДД.ММ.ГГГГ)
    Time.now.strftime("%H:%M:%S"),      # время (ЧЧ:ММ:СС)
    sensor.celsius)                     # температуру (ТТТ.ТТТ)
  sleep 1                               # "заснуть" на 1 секунду
end
