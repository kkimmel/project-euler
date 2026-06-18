#!/usr/bin/ruby

require_relative 'prime_helpers'

limit = 2_000_000

primes = PrimeHelpers.sieve(limit)

# Sum all primes strictly below the limit
sum = primes.select { |p| p < limit }.sum

puts "Sum of all primes below #{limit}: #{sum}"
