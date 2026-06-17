#!/usr/bin/ruby

# Problem 15: Lattice Paths
#
# Starting in the top left corner of a 20x20 grid, and only being able to
# move right or down, how many routes are there through the grid to the
# bottom right corner?
#
# Any valid path through the grid requires exactly 20 moves right and 20
# moves down, for a total of 40 moves. The problem reduces to: in how many
# ways can we arrange 20 rights and 20 downs in a sequence of 40 moves?
#
# This is the binomial coefficient C(40, 20) = 40! / (20! * 20!)
#
# We can compute this efficiently without calculating large factorials by
# using the multiplicative formula:
#   C(n, k) = (n * (n-1) * ... * (n-k+1)) / k!
#
# For a grid of size n x n, the answer is C(2n, n).

def binomial_coefficient(n, k)
  # Use the smaller of k and n-k for efficiency
  k = n - k if k > n - k

  result = 1
  k.times do |i|
    result = result * (n - i) / (i + 1)
  end

  result
end

grid_size = 20
routes    = binomial_coefficient(2 * grid_size, grid_size)

puts "Number of routes through a #{grid_size}x#{grid_size} grid: #{routes}"
