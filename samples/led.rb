#!/usr/bin/ruby

require "led"

led = LED.new(18)           # создать объект led класса LED на контакте 18

5.times do                  # повторить 5 раз
  led.on                    # скомандовать объекту led включиться (on)
  sleep 1                   # остановить выполнение программы на 1 секунду
  led.off                   # скомандовать объекту led выключиться (off)
  sleep 1
end

print "Мигание...\n"
led.blink(3)                # скомандовать led помигать (blink) 3 раза

