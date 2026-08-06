#!/usr/bin/ruby

# Triangle numbers are T(n) = n*(n+1)/2.
# Find the first triangle number with more than 500 divisors.
#
# Approach:
#   The number of divisors of m can be found via prime factorisation:
#   if m = p1^a1 * p2^a2 * ..., then num_divisors(m) = (a1+1)*(a2+1)*...
#
#   Since n and n+1 are always coprime, we exploit:
#     num_divisors(T(n)) = num_divisors(n/2) * num_divisors(n+1)   when n is even
#     num_divisors(T(n)) = num_divisors(n)   * num_divisors((n+1)/2) when n is odd

num_divisors = lambda do |m|
  count   = 1
  divisor = 2

  while divisor * divisor <= m
    if m % divisor == 0
      exp = 0
      while m % divisor == 0
        exp += 1
        m   /= divisor
      end
      count *= (exp + 1)
    end
    divisor += 1
  end

  count *= 2 if m > 1  # m is a remaining prime factor with exponent 1
  count
end

n = 1
loop do
  # T(n) = n*(n+1)/2; n and n+1 are coprime so we split the division by 2
  divisors = if n.even?
               num_divisors.call(n / 2) * num_divisors.call(n + 1)
             else
               num_divisors.call(n) * num_divisors.call((n + 1) / 2)
             end

  if divisors > 500
    triangle = n * (n + 1) / 2
    puts "First triangle number with more than 500 divisors: #{triangle}"
    puts "Number of divisors: #{divisors}"
    break
  end

  n += 1
end
