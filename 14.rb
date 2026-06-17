#!/usr/bin/ruby

memo = {}

def collatz_length(n, memo)
  return memo[n] if memo[n]
  return 1 if n == 1

  next_n = n.even? ? n / 2 : 3 * n + 1
  memo[n] = 1 + collatz_length(next_n, memo)
  memo[n]
end

max_length = 0
max_start  = 0

(1...1_000_000).each do |i|
  length = collatz_length(i, memo)
  if length > max_length
    max_length = length
    max_start  = i
  end
end

puts "Starting number: #{max_start}"
puts "Sequence length: #{max_length}"
