#!/usr/bin/ruby

# Starting in the top-left corner of a 20x20 grid, and only being able to
# move right or down, how many routes are there through the grid to the
# bottom-right corner?
#
# Approach:
#   Any valid route across an n×n grid takes exactly 2n steps: n right and
#   n down, in some order.  The number of distinct routes is therefore the
#   number of ways to choose which n of the 2n steps are "right" moves:
#
#     C(2n, n) = (2n)! / (n! * n!)
#
#   For n = 20: C(40, 20) = 137,846,528,640

n      = 20
routes = (1..2 * n).reduce(1, :*) / ((1..n).reduce(1, :*) ** 2)

puts "Number of routes through a #{n}x#{n} grid: #{routes}"
