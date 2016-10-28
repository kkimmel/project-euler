#!/usr/bin/ruby

def get_pythagorean_triplet(n)
    (1..(n / 3).floor).each do |a|
        (a + 1..(n / 2).floor).each do |b|
            c = n - b - a

            if a**2 + b**2 == c**2
                return [a, b, c]
            end
        end
    end
end

n         = 1000
(a, b, c) = get_pythagorean_triplet(n)

puts "a: #{a}, b: #{b}, c: #{c}"
puts "product: #{a * b * c}"
