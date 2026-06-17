#!/usr/bin/ruby

# Problem 15: Lattice Paths
#
# Starting in the top left corner of a 20x20 grid, and only being able to
# move right or down, how many routes are there through the grid to the
# bottom right corner?
#
# ---------------------------------------------------------------------------
# Key Insight: Framing as a Combinatorics Problem
# ---------------------------------------------------------------------------
#
# To travel from the top-left to the bottom-right of a 20x20 grid, you must
# make exactly 40 moves total: 20 moves to the right (R) and 20 moves down (D).
#
# Every unique path is just a unique arrangement of those 40 moves, e.g.:
#   R R R ... D D D ...  (all rights first, then all downs)
#   R D R D R D ...      (alternating)
#   D D D ... R R R ...  (all downs first, then all rights)
#
# So the question becomes: in how many ways can you arrange 20 R's and 20 D's
# in a sequence of 40 moves?
#
# ---------------------------------------------------------------------------
# The Binomial Coefficient: C(n, k) = n! / (k! * (n - k)!)
# ---------------------------------------------------------------------------
#
# The binomial coefficient C(n, k), also written as "n choose k", answers the
# question: "In how many ways can I choose k items from a set of n items,
# where order does NOT matter?"
#
# The formula is:
#   C(n, k) = n! / (k! * (n - k)!)
#
# Why does this apply here?
#   - We have n = 40 total moves (positions in our sequence)
#   - We need to choose k = 20 of those positions to be "Right" moves
#   - The remaining 20 positions are automatically "Down" moves
#   - Order within each group does NOT matter — all R's are identical,
#     and all D's are identical
#
# So our answer is: C(40, 20) = 40! / (20! * 20!)
#
# ---------------------------------------------------------------------------
# Concrete Example: 2x2 Grid
# ---------------------------------------------------------------------------
#
# For a 2x2 grid, we need 4 moves total: 2 Right and 2 Down.
# C(4, 2) = 4! / (2! * 2!) = 24 / (2 * 2) = 6 paths:
#
#   RRDD, RDRD, RDDR, DRRD, DRDR, DDRR  → 6 unique paths ✓
#
# ---------------------------------------------------------------------------
# Computing the Answer for a 20x20 Grid
# ---------------------------------------------------------------------------
#
# C(40, 20) = 40! / (20! * 20!)
#
# Ruby handles arbitrarily large integers natively, so we can compute
# factorials directly without overflow.

def factorial(n)
  (1..n).reduce(1, :*)
end

def binomial_coefficient(n, k)
  # C(n, k) = n! / (k! * (n - k)!)
  factorial(n) / (factorial(k) * factorial(n - k))
end

grid_size = 20

# Total moves = grid_size * 2 (e.g. 40 for a 20x20 grid)
# Choose grid_size of them to be "Right" (e.g. choose 20 out of 40)
total_moves = grid_size * 2
paths = binomial_coefficient(total_moves, grid_size)

puts "Grid size:    #{grid_size}x#{grid_size}"
puts "Total moves:  #{total_moves} (#{grid_size} right + #{grid_size} down)"
puts "Formula:      C(#{total_moves}, #{grid_size}) = #{total_moves}! / (#{grid_size}! * #{grid_size}!)"
puts "Total paths:  #{paths}"
