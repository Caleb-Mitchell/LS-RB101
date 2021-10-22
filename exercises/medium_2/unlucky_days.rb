require 'date'

def friday_13th(year)
  Date.new(year).step(Date.new(year, -1, -1))
      .select { |day| day.friday? && day.mday == 13 }.size
end

# puts friday_13th(2020)
puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2
