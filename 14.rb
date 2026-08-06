#!/usr/bin/ruby

# Problem 14 - Longest Collatz sequence
#
# The following iterative sequence is defined for the set of positive integers:
#   n -> n/2  (n is even)
#   n -> 3n+1 (n is odd)
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

cache         = {}
limit         = 1_000_000
longest_start = 1
longest_chain = 1

(1...limit).each do |n|
  length = collatz_length(n, cache)
  if length > longest_chain
    longest_chain = length
    longest_start = n
  end
end

puts "Starting number: #{longest_start}"
puts "Chain length:    #{longest_chain}"
