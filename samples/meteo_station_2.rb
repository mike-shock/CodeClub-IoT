#!/usr/bin/ruby

class MeteoStation # v.1
  def start
    log("Начало работы")
  end

  def log(message)
    timestamp = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    printf("%s %s\n", timestamp, message)
 end
end

meteo = MeteoStation.new
meteo.start
