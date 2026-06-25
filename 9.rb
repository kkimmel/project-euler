#!/usr/bin/ruby

# Uses Euclid's Formula to generate Pythagorean triplets.
# For integers m > n > 0, a primitive triplet is:
#   a = m^2 - n^2
#   b = 2mn
#   c = m^2 + n^2
# Scaling by k gives all triplets: a*k, b*k, c*k
def get_pythagorean_triplet(target_sum)
  m = 2
  while m * (m + 1) * 2 <= target_sum
    (1...m).each do |n|
      a = m**2 - n**2
      b = 2 * m * n
      c = m**2 + n**2
      sum = a + b + c

      if target_sum % sum == 0
        k = target_sum / sum
        return [a * k, b * k, c * k].sort
      end
    end
    m += 1
  end
end

n         = 1000
(a, b, c) = get_pythagorean_triplet(n)

puts "a: #{a}, b: #{b}, c: #{c}"
puts "product: #{a * b * c}"
