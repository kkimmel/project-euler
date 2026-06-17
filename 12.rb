#!/usr/bin/ruby

def count_divisors(n)
  count = 0
  i = 1

  while i * i <= n
    if n % i == 0
      count += (i * i == n) ? 1 : 2
    end

    i += 1
  end

  count
end

def first_triangle_with_divisors_over(limit)
  index        = 1
  triangle_num = 0

  loop do
    triangle_num += index

    return triangle_num if count_divisors(triangle_num) > limit

    index += 1
  end
end

puts "first triangle number with over 500 divisors: #{first_triangle_with_divisors_over(500)}"
