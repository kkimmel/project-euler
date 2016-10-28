#!/usr/bin/ruby

n1, n2, sum = 1, 2, 0

while n2 < 4000000
  sum += n2 if n2.even?

  n1, n2 = n2, n2 + n1
end

puts "sum: #{sum}"
