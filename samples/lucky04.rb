#!/usr/bin/ruby

n = 0
for n1 in (0...10)
  for n2 in (0...10)
    for n3 in (0...10)
      for n4 in (0...10)
        for n5 in (0...10)
          for n6 in (0...10)
            if (n1+n2+n3 == n4+n5+n6)
              n += 1
              i = n1*100000 + n2*10000 + n3*1000 + n4*100 +n5*10 + n6
              printf("%06d %d %d %d %d %d %d\n", i, n1, n2, n3, n4, n5, n6)
            end
          end
        end
      end
    end
  end
end
printf("%d\n", n)
