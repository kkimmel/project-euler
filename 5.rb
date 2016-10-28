#!/usr/bin/ruby

max = 20

def get_smallest_multiple(max)
  multiplier = 1

  # Check all multiples of max until one
  # is divisible by all other numbers
  while multiplier
    n = multiplier * max

    divisible = true
    (max - 1).times do |index|
      divisor = max - (index + 1)
      if n % divisor != 0
        divisible = false
        break
      end
    end

    if divisible
      return n
    end

    multiplier += 1
  end
end

puts "smallest multiple: #{get_smallest_multiple(max)}"
