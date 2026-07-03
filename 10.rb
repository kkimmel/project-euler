#!/usr/bin/ruby

require_relative 'prime_helpers'

primes = PrimeHelpers.sieve(2_000_000)
sum = primes.sum

puts "sum: #{sum}"
