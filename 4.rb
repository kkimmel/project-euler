#!/usr/bin/ruby

def is_palindrome?(n)
  a = n.to_s.chars

  while a.size > 1
    n1 = a.shift
    n2 = a.pop

    return false unless n1 == n2
  end

  return true
end

def get_largest_palindrome(max)
  n1 = max
  n2 = max

  palindromes = []

  while n1 > 0
    while n2 > 0
      product = n1 * n2
      palindromes.push(product) if is_palindrome?(product)

      n2 -= 1
    end

    n2 = n1 -= 1
  end

  return palindromes.max
end

puts "largest palindrome: #{get_largest_palindrome(999)}"
