#!/usr/bin/ruby

def get_pythagorean_triplet(n)
  # Euclid's formula generates Pythagorean triplets:
  # a = k(m² - n²)
  # b = k(2mn)
  # c = k(m² + n²)
  # where m > n > 0 and k is a scaling factor
  #
  # The perimeter is: k(m² - n² + 2mn + m² + n²) = k(2m² + 2mn) = 2km(m + n)
  # We need: 2km(m + n) = 1000

  (1..Math.sqrt(n).to_i).each do |m|
    (1...m).each do |n_param|
      # For each (m, n) pair, find the scaling factor k
      perimeter_base = 2 * m * (m + n_param)

      if n % perimeter_base == 0
        k = n / perimeter_base

        # Generate the triplet
        a = k * (m**2 - n_param**2)
        b = k * (2 * m * n_param)
        c = k * (m**2 + n_param**2)

        # Ensure a < b < c
        a, b = b, a if a > b

        # Verify the solution
        if a + b + c == n && a**2 + b**2 == c**2
          return [a, b, c]
        end
      end
    end
  end
end

n         = 1000
(a, b, c) = get_pythagorean_triplet(n)

puts "a: #{a}, b: #{b}, c: #{c}"
puts "product: #{a * b * c}"
