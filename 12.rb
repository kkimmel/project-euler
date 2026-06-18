#!/usr/bin/ruby

# Count the number of divisors of n using prime factorization.
# If n = p1^a1 * p2^a2 * ..., the divisor count is (a1+1) * (a2+1) * ...
def count_divisors(n)
  return 1 if n == 1

  count = 1
  divisor = 2

  while divisor * divisor <= n
    if n % divisor == 0
      exponent = 0
      while n % divisor == 0
        exponent += 1
        n /= divisor
      end
      count *= (exponent + 1)
    end
    divisor += 1
  end

  # If n > 1 there is one remaining prime factor with exponent 1
  count *= 2 if n > 1

  count
end

n = 1
loop do
  triangle = n * (n + 1) / 2
  if count_divisors(triangle) > 500
    puts "First triangle number with over 500 divisors: #{triangle}"
    break
  end
  n += 1
end
