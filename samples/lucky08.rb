#!/usr/bin/ruby

happy_file_name = "lucky04-rb.txt"
n = 0
total = 100000
ranges = {}

File.open(happy_file_name) do |file|
  while (string = file.gets) do
    break if (n = string.chomp.to_i) == 55252
    number = string[0..5].to_i
    n1 = string[0].to_i
    printf "%d %06d\n", n1, number
    ranges[n1*100000] ||= []
    ranges[n1*100000] << number
  end
end

printf("%d %d %f %% \n", total, n, n * 100.0 / total)
h = 0
for k in ranges.keys.sort do
  x = ranges[k].length
  h += x
  pro = x * 100.0 / total
  p   = x * 100.0 / n
  printf("%06d %d %5.2f %% %5.2f %% %s \n",  k, x, pro, p, ('*'*(x/100).to_i) )
end
print(h)
