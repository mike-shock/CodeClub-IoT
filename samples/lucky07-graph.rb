#!/usr/bin/ruby

total = 0
n = 0
ranges = {}
for n1 in (0...10) do
	for n2 in (0...10) do
		for n3 in (0...10) do
			ranges[n1*100000 + n2*10000 + n3*1000] = []
			for n4 in (0...10) do
				for n5 in (0...10) do
					for n6 in (0...10) do
						total += 1
						if (n1+n2+n3 == n4+n5+n6) then
							n += 1
							i = n1*100000 + n2*10000 + n3*1000 + n4*100 +n5*10 + n6
							ranges[n1*100000 + n2*10000 + n3*1000].append(i)
						end
					end
				end
			end
		end
	end
end
printf("%d %6.4f %%\n", n, n * 100.0 / total)

h = 0
for k in ranges.keys.sort do
	x = ranges[k].length
	h += x
	pro = x * 100.0 / total
	p   = x * 100.0 / n
	printf("%06d %02d %6.4f %% %5.2f %% %s\n", k, x, pro, p, '*'*(x/2).to_i)
end
printf("%d\n", h)
