#!/usr/bin/ruby

# Count the number of divisors of n using prime factorization.
# If n = p1^a1 * p2^a2 * ..., then divisor count = (a1+1) * (a2+1) * ...
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

  # Any remaining factor is a prime with exponent 1
  count *= 2 if n > 1

  count
end

target = 500
n      = 1

loop do
  # T(n) = n * (n + 1) / 2
  # n and n+1 are coprime, so divisors(T(n)) = divisors(n/2) * divisors(n+1)
  # or divisors(n) * divisors((n+1)/2), depending on which is even
  if n % 2 == 0
    num_divisors = count_divisors(n / 2) * count_divisors(n + 1)
  else
    num_divisors = count_divisors(n) * count_divisors((n + 1) / 2)
  end

  if num_divisors > target
    triangle = n * (n + 1) / 2
    puts "First triangle number with more than #{target} divisors: #{triangle}"
    break
  end

  n += 1
end
