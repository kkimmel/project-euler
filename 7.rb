#!/usr/bin/ruby

require_relative 'prime_helpers'

n = 10001

# Find the upper bound for the nth prime
ln_of_n       = Math.log(n, Math::E)
ln_of_ln_of_n = Math.log(ln_of_n, Math::E)
max = n * ln_of_n + n * ln_of_ln_of_n

puts "Upper bound for #{n}th prime: #{max}"

primes = PrimeHelpers.sieve(max)
puts "#{n}th prime: #{primes[n - 1]}"
