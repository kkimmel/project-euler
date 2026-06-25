#!/usr/bin/ruby

require_relative 'prime_helpers'

limit = 2_000_000

primes = PrimeHelpers.sieve(limit)
puts "Sum of all primes below #{limit}: #{primes.sum}"
