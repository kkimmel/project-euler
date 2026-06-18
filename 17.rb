#!/usr/bin/ruby

ONES = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
        "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen",
        "sixteen", "seventeen", "eighteen", "nineteen"]

TENS = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

def number_to_words(n)
  if n == 1000
    "onethousand"
  elsif n >= 100
    hundreds_digit = n / 100
    remainder      = n % 100
    word           = ONES[hundreds_digit] + "hundred"
    word          += "and" + number_to_words(remainder) if remainder > 0
    word
  elsif n >= 20
    tens_digit = n / 10
    ones_digit = n % 10
    word       = TENS[tens_digit]
    word      += ONES[ones_digit] if ones_digit > 0
    word
  else
    ONES[n]
  end
end

total = (1..1000).sum { |n| number_to_words(n).length }

puts "Total letters used (1 to 1000): #{total}"
