#!/usr/bin/ruby

require_relative 'prime_helpers'

max = 2_000_000

primes = PrimeHelpers.sieve(max)
sum = primes.sum

puts "Sum of all primes below #{max}: #{sum}"
