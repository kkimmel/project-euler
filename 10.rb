#!/usr/bin/ruby

require_relative 'prime_helpers'

max = 2_000_000

primes = PrimeHelpers.sieve(max)
puts primes.sum
