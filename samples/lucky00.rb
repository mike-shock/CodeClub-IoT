#!/usr/bin/ruby

# Класс для нахождения счастливых билетов в рулоне
class RollOfTickets
  attr :lo
  attr :hi

  def initialize(lo=0, hi=999999)
    @lo = lo
    @hi = hi
  end

#  def self.new_roll(n=1000000)
#    self.new(0, n-1)
#  end

  def RollOfTickets.new_roll(n=1000000)
    RollOfTickets.new(0, n-1)
  end


  def is_lucky(i)                        # 123456
    s = "%06d" % i                       # '123456'
    l = s.split('')                      # ['1', '2', '3', '4', '5', '6']
    a = l.map { |d| d.to_i }             # [1, 2, 3, 4, 5, 6]
    return (a[0..2].sum == a[3..5].sum)  # sum([1, 2, 3]) == sum([4, 5, 6])
  end

 protected
  def lucky?(i)                 # 123456
    h1, h2, h3 = head(i)
    t1, t2, t3 = tail(i)
    return ((h1+h2+h3) == (t1+t2+t3))
  end

 public
  def lucky1()
    tickets = []
    for i in (@lo..@hi)
      if (self.is_lucky(i))
        tickets << i
      end
    end
    return tickets
  end

  def lucky()
    tickets = []
    for i in (@lo..@hi)
      tickets << i if (self.lucky?(i))
    end
    return tickets
  end

 private
  def head(i)                                                     # 123456
    h = (i/1000).to_i                                             # 123
    return (h/100).to_i, ((h % 100)/10).to_i, ((h % 100)%10).to_i # 1,2,3
  end

  def tail(i)                                                     # 123456
    t = i % 1000                                                  # 456
    return (t/100).to_i, ((t % 100)/10).to_i, ((t % 100)%10).to_i # 4,5,6
  end
end

roll = RollOfTickets.new
lucky_tickets = roll.lucky()

p(lucky_tickets)
p(lucky_tickets.size)

p (roll.is_lucky(123456))
p (roll.is_lucky(123321))

roll2 = RollOfTickets.new_roll
p roll2.lucky().size

