#!/usr/bin/ruby

# Problem 14: Longest Collatz sequence
#
# The following iterative sequence is defined for the set of positive integers:
#   n -> n/2       (n is even)
#   n -> 3n + 1    (n is odd)
#
# Starting from 13: 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
# The sequence contains 10 terms.
#
# Which starting number, under one million, produces the longest chain?

def collatz_length(n, cache)
  return cache[n] if cache[n]

  length = if n == 1
    1
  elsif n.even?
    1 + collatz_length(n / 2, cache)
  else
    1 + collatz_length(3 * n + 1, cache)
  end

  cache[n] = length
  length
end

cache       = {}
max_length  = 0
max_start   = 0

(1...1_000_000).each do |i|
  length = collatz_length(i, cache)

  if length > max_length
    max_length = length
    max_start  = i
  end
end

puts "Starting number: #{max_start}"
puts "Collatz chain length: #{max_length}"
