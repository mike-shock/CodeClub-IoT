#!/usr/bin/ruby

lo = 0
hi = 999999
n = 0
for i in (lo..hi)                  # 123456
  s = "%06d" % i                   # '123456'
  l = s.split('')                  # ['1', '2', '3', '4', '5', '6']
  a = l.map { |d| d.to_i }         # [1, 2, 3, 4, 5, 6]
  if (a[0..2].sum == a[3..5].sum)  # sum([1, 2, 3]) == sum([4, 5, 6])
    n += 1
    printf("%06d\n", i)
  end
end
printf("%d\n", n)
