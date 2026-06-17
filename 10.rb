#!/usr/bin/ruby

require_relative 'prime_helpers'

limit = 2_000_000

# Generate all primes below the limit using the Sieve of Eratosthenes
primes = PrimeHelpers.sieve(limit)

# Sum all the primes
sum = primes.sum

puts "Sum of all primes below #{limit}: #{sum}"
