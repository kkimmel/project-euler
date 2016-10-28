#!/usr/bin/ruby

max = 100

sum_of_squares = ((2 * max + 1) * (max + 1) * max / 6.0).round(0)
sum_of_numbers = max * (max + 1) / 2
square_of_sum  = sum_of_numbers ** 2

puts "sum of the squares: #{sum_of_squares}"
puts "square of the sum: #{square_of_sum}"
puts "difference: #{square_of_sum - sum_of_squares}"
