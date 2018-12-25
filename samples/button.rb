#!/usr/bin/ruby

require "button"

button = Button.new(21)       # создать объект button класса Button на контакте BCM 21

print "Нажмите на кнопку 1 раз.\n"
button.wait_for_press         # ожидать одиночного нажатия на кнопку
if button.long_press?         # нажатие было длинным? (> 1 секунды)
  print "Длинное!\n"
else
  print "Короткое.\n"
end

print "Нажмите на кнопку 2 раза.\n"
button.wait_for_presses(2)   # ожидать двойного нажатия на кнопку
if button.double_press?      # было двойное нажатие?
  print "Двойное...\n"
else
  print "2 одинарных?\n"
end

12.times do
  if button.pressed?
    print "Кнопка нажата!\n"
  else
    print "Кнопка не нажата...\n"
  end
  sleep 0.5
end