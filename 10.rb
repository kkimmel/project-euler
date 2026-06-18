#!/usr/bin/ruby

require_relative 'prime_helpers'

# Problem 10: Summation of primes
# Find the sum of all the primes below two million.

limit = 2_000_000

primes = PrimeHelpers.sieve(limit)
sum = primes.select { |p| p < limit }.sum

puts "Sum of all primes below #{limit}: #{sum}"
