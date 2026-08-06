#!/usr/bin/ruby

# Collatz sequence rules:
#   n is even -> n / 2
#   n is odd  -> 3n + 1
# Which starting number under 1,000,000 produces the longest chain?

limit = 1_000_000
cache = {}

collatz_length = lambda do |n|
  return cache[n] if cache.key?(n)
  return 1 if n == 1

  length = 1 + collatz_length.call(n.even? ? n / 2 : 3 * n + 1)
  cache[n] = length
  length
end

longest_start  = (1...limit).max_by { |n| collatz_length.call(n) }

puts "Starting number under #{limit} with longest Collatz chain: #{longest_start}"
puts "Chain length: #{collatz_length.call(longest_start)}"
