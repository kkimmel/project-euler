#!/usr/bin/ruby

require_relative 'prime_helpers'

n = 600851475143

primes        = PrimeHelpers.sieve((n ** 0.5).floor + 1)
prime_factors = []

primes.each do |prime|
  while n % prime == 0
    prime_factors.push(prime)
    n /= prime
  end

  break if n == 1
end

prime_factors.push(n) if n > 1

puts "largest prime factor: #{prime_factors.max}"
