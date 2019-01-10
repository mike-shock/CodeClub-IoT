#!/usr/bin/ruby

lo = 0
hi = 999999
n = 0
for i in (lo..hi)               # 123456
  s = "%06d" % i                # '123456'
  l = s.split('')               # ['1', '2', '3', '4', '5', '6']
  head = 0
  for h in l[0..2]              # ['1', '2', '3']
    head += h.to_i
  end
  tail = 0
  for t in l[3..5]              # ['4', '5', '6']
    tail += t.to_i
  end
  if (head == tail)
    n += 1
    printf("%06d\n", i)
  end
end
printf("%d\n", n)
