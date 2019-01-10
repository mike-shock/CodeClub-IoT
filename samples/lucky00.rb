#!/usr/bin/ruby

# Класс для нахождения счастливых билетов в рулоне
class LuckyTickets
  def initialize(lo=0, hi=999999)
    @lo = lo
    @hi = hi
  end

  def is_lucky(i)                        # 123456
    s = "%06d" % i                       # '123456'
    l = s.split('')                      # ['1', '2', '3', '4', '5', '6']
    a = l.map { |d| d.to_i }             # [1, 2, 3, 4, 5, 6]
    return (a[0..2].sum == a[3..5].sum)  # sum([1, 2, 3]) == sum([4, 5, 6])
  end

  def lucky()
    tickets = []
    for i in (@lo..@hi)
      if (self.is_lucky(i))
        tickets << i
      end
    end
    return tickets
  end
end

roll = LuckyTickets.new
lucky_tickets = roll.lucky()

p(lucky_tickets)
p(lucky_tickets.size)

p (roll.is_lucky(123456))
p (roll.is_lucky(123321))


