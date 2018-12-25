#!/bin/bash
PIN=18                   # логический № контакта BCM 18
for n in 1 2 3 4 5       # присваивая переменной n числа от 1 до 5
do                       # выполнить цикл (5 раз)
  echo $n                # вывести на экран значение переменной n
  echo $PIN > /sys/class/gpio/export          # задействовать pin14
  echo out > /sys/class/gpio/gpio18/direction # для записи (out)
  echo 1 > /sys/class/gpio/gpio18/value       # установить его в 1
  sleep 1                # ждать 1 секунду (LED включен)
  echo 0 > /sys/class/gpio/gpio18/value       # установить его в 0
  echo $PIN > /sys/class/gpio/unexport        # освободить pin14
  sleep 1                # ждать 1 секунду (LED выключен)
done                     # повторить цикл

# Запуск в терминальном окне: sudo ./led.sh
