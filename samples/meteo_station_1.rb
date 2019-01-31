#!/usr/bin/ruby

class MeteoStation
  def start
    printf("%s Начало работы\n", Time.now.strftime("%Y-%m-%d %H:%M:%S"))
  end
end

meteo = MeteoStation.new
meteo.start
