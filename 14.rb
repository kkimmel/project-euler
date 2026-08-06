#!/usr/bin/ruby

# Collatz sequence: n -> n/2 (even) or 3n+1 (odd), repeat until 1.
# Find the starting number under 1,000,000 that produces the longest chain.

memo = { 1 => 1 }

collatz_length = lambda do |n|
  return memo[n] if memo[n]

  memo[n] = 1 + collatz_length.call(n.even? ? n / 2 : 3 * n + 1)
end

max_length = 0
max_number = 0

(1...1_000_000).each do |i|
  length = collatz_length.call(i)
  if length > max_length
    max_length = length
    max_number = i
  end
end

puts "starting number: #{max_number}"
puts "chain length: #{max_length}"
