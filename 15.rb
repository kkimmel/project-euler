#!/usr/bin/ruby

# Problem 15: Lattice Paths
#
# Starting in the top left corner of a 2x2 grid, and only being able to
# move to the right and down, there are exactly 6 routes to the bottom
# right corner. How many such routes are there through a 20x20 grid?
#
# Dynamic programming approach:
#   Build a (n+1) x (n+1) grid where each cell represents the number of
#   unique paths to reach that cell from the top-left corner.
#
#   Base cases:
#     - Every cell in the first row can only be reached by moving right,
#       so there is exactly 1 path to each of those cells.
#     - Every cell in the first column can only be reached by moving down,
#       so there is exactly 1 path to each of those cells.
#
#   Recurrence:
#     grid[i][j] = grid[i-1][j] + grid[i][j-1]
#
#   The answer is grid[n][n].

n    = 20
grid = Array.new(n + 1) { Array.new(n + 1, 0) }

# Base cases: one way to reach any cell in the first row or first column
(0..n).each { |i| grid[0][i] = 1; grid[i][0] = 1 }

# Fill the rest of the grid
(1..n).each do |i|
  (1..n).each do |j|
    grid[i][j] = grid[i - 1][j] + grid[i][j - 1]
  end
end

puts "routes: #{grid[n][n]}"
