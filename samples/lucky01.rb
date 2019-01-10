#!/usr/bin/ruby

lo = 0
hi = 999999
n = 0
for i in (lo.. hi) do       # 123456
  head = (i/1000).to_i        # 123
  h1 = (head/100).to_i        # 1
  h2 = ((head % 100)/10).to_i # 2
  h3 = ((head % 100)%10).to_i # 3
  tail = i % 1000           # 456
  t1 = (tail/100).to_i        # 4
  t2 = ((tail % 100)/10).to_i # 5
  t3 = ((tail % 100)%10).to_i # 6
#  printf("%06d %03d %d %d %d %03d %d %d %d\n", i, head, h1, h2, h3, tail, t1, t2, t3)
  if ((h1+h2+h3) == (t1+t2+t3))
    n += 1
    printf("%06d\n", i)
  end
end
printf("%d\n", n)
