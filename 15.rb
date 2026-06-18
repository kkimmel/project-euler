#!/usr/bin/ruby

# Problem 15: Lattice Paths
#
# Starting in the top left corner of a 2x2 grid, and only being able to
# move to the right and down, there are exactly 6 routes to the bottom
# right corner. How many such routes are there through a 20x20 grid?
#
# Binomial coefficient approach:
#   To traverse a 20x20 grid from top-left to bottom-right, you must make
#   exactly 40 moves: 20 right (R) and 20 down (D).
#
#   The number of unique routes is the number of ways to arrange 20 R's
#   and 20 D's in a sequence of 40 moves, which is the binomial coefficient:
#
#     C(2n, n) = (2n)! / (n! * n!)
#
#   For n = 20: C(40, 20) = 40! / (20! * 20!)

def binomial(n, k)
  (1..k).inject(1) { |result, i| result * (n - i + 1) / i }
end

n = 20
puts "routes: #{binomial(2 * n, n)}"
