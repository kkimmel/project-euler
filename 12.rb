#!/usr/bin/ruby

require_relative 'prime_helpers'

TARGET = 500

# Count the number of divisors of n using its prime factorisation.
# If n = p1^a1 * p2^a2 * ... * pk^ak, then the divisor count is
# (a1+1)(a2+1)...(ak+1).
def count_divisors(n, primes)
  count = 1

  primes.each do |prime|
    break if prime * prime > n

    if n % prime == 0
      exponent = 0
      while n % prime == 0
        exponent += 1
        n /= prime
      end
      count *= exponent + 1
    end
  end

  # If n > 1 here, the remaining value is a prime factor with exponent 1
  count *= 2 if n > 1

  count
end

# T(n) = n * (n+1) / 2.  Because gcd(n, n+1) = 1 the two factors are
# coprime, so we can count their divisors separately and multiply.
# Exactly one of the two is even, so we divide that one by 2 before
# factorising and the result is still an integer.
def triangular_divisor_count(n, primes)
  if n.even?
    count_divisors(n / 2, primes) * count_divisors(n + 1, primes)
  else
    count_divisors(n, primes) * count_divisors((n + 1) / 2, primes)
  end
end

# We need an upper bound for the sieve.  500 divisors is reached well
# before the 15 000th triangular number; using 1_000_000 is safe and fast.
SIEVE_MAX = 1_000_000
primes = PrimeHelpers.sieve(SIEVE_MAX)

n = 1
loop do
  if triangular_divisor_count(n, primes) > TARGET
    triangular_number = n * (n + 1) / 2
    puts "first triangular number with more than #{TARGET} divisors: #{triangular_number}"
    break
  end
  n += 1
end
