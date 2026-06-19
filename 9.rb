#!/usr/bin/ruby

# Uses Euclid's formula to generate Pythagorean triplets.
# For integers m > n > 0:
#   a = m^2 - n^2
#   b = 2mn
#   c = m^2 + n^2
#
# These satisfy a^2 + b^2 = c^2 by construction.
# A primitive triplet requires m and n to be coprime and not both odd.
# Non-primitive triplets are obtained by scaling by a factor k:
#   a = k(m^2 - n^2), b = 2kmn, c = k(m^2 + n^2)
#
# We need a + b + c = 1000:
#   k(m^2 - n^2) + 2kmn + k(m^2 + n^2) = 1000
#   k * 2m(m + n) = 1000
#   k = 500 / (m * (m + n))

def gcd(a, b)
  b == 0 ? a : gcd(b, a % b)
end

def get_pythagorean_triplet_euclid(target)
  m = 2
  while m * m < target
    (1...m).each do |n|
      # Only generates primitive triplets when m and n are coprime and not both odd
      next if gcd(m, n) != 1 || (m.odd? && n.odd?)

      # Derive k from the constraint a + b + c = target
      # k * 2m(m + n) = target => k = target / (2m(m + n))
      denominator = 2 * m * (m + n)
      next if target % denominator != 0

      k = target / denominator
      a = k * (m**2 - n**2)
      b = k * (2 * m * n)
      c = k * (m**2 + n**2)

      return [a, b, c]
    end
    m += 1
  end
end

n         = 1000
(a, b, c) = get_pythagorean_triplet_euclid(n)

puts "a: #{a}, b: #{b}, c: #{c}"
puts "product: #{a * b * c}"
