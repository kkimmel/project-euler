class PrimeHelpers
  # Implementation of the sieve of Eratosthenes
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
