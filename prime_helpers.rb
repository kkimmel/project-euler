class PrimeHelpers
  # Implementation of the Sieve of Eratosthenes - an ancient algorithm for
  # finding all prime numbers up to a given limit. It works by iteratively
  # marking the multiples of each prime as composite (not prime), starting
  # from 2. The numbers that remain unmarked at the end are prime.
  def self.sieve(max)
    integers = Array.new(max - 2, true)
    primes   = []

    integers.each_with_index do |is_prime, index|
      if is_prime
        value = index + 2
        primes.push(value)

        multiple = value * 2
        while multiple <= max
          integers[multiple - 2] = false

          multiple += value
        end
      end
    end

    return primes
  end
end
