#!/usr/bin/ruby

# What is the greatest product of four adjacent numbers in the same direction
# (up, down, left, right, or diagonally) in the 20x20 grid?

grid = <<~GRID
  08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
  49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
  81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
  52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
  22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
  24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
  32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
  67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21
  24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72
  21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95
  78 17 53 28 22 75 82 87 38 30 63 61 81 30 37 41 25 89 95 95
  14 29 93 71 40 67 53 88 30 03 49 13 36 65 52 70 95 23 04 60
  11 42 69 24 68 56 01 32 56 71 37 02 36 91 22 31 16 71 51 67
  63 89 41 92 36 54 22 40 40 28 66 33 13 80 24 47 32 60 99 03
  45 02 44 75 33 53 78 36 84 20 35 17 12 50 32 98 81 28 64 23
  67 10 26 38 40 67 59 54 70 66 18 38 64 70 67 26 20 68 02 62
  12 20 95 63 94 39 63 08 40 91 66 49 94 21 24 55 58 05 66 73
  99 26 97 17 78 78 96 83 14 88 34 89 63 72 21 36 23 09 75 00
  76 44 20 45 35 14 00 61 33 97 34 31 33 95 78 17 53 28 22 75
  82 87 38 30 63 61 81 30 37 41 25 89 95 95 14 29 93 71 40 67
GRID

grid = grid.strip.split("\n").map { |line| line.split.map(&:to_i) }

max_product = 0

grid.each_with_index do |row, i|
  row.each_with_index do |_, j|
    # Right
    if j + 3 < 20
      product = grid[i][j] * grid[i][j+1] * grid[i][j+2] * grid[i][j+3]
      max_product = [max_product, product].max
    end

    # Down
    if i + 3 < 20
      product = grid[i][j] * grid[i+1][j] * grid[i+2][j] * grid[i+3][j]
      max_product = [max_product, product].max
    end

    # Diagonal down-right
    if i + 3 < 20 && j + 3 < 20
      product = grid[i][j] * grid[i+1][j+1] * grid[i+2][j+2] * grid[i+3][j+3]
      max_product = [max_product, product].max
    end

    # Diagonal down-left
    if i + 3 < 20 && j - 3 >= 0
      product = grid[i][j] * grid[i+1][j-1] * grid[i+2][j-2] * grid[i+3][j-3]
      max_product = [max_product, product].max
    end
  end
end

puts "largest product: #{max_product}"
