class Number < ApplicationRecord
  attr_reader :primes, :composites, :integer
  validates :value, presence: true
  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  def initialize(*args)
    @primes = {}
    @composites = {}
    @integer = 2
    super
  end

  def generate_primes(quantity=3)
    @composites = {}
    @integer = 3
    first = 2
    second = 3
    third = 5
    if quantity >= 1
      @primes[first] = first
    end
    if quantity >= 2
      @primes[second] = second
    end
    if quantity >= 3
      @primes[third] = third
    end

    # Divide the range 2 through n into segments of some size Δ ≤ √n.
    segment_size = 1000
    from = @integer
    to = segment_size
    logger.debug {"Start segment of size #{segment_size} from #{from} to #{to} (first segment)"}
    while @primes.size < quantity
      logger.debug {"Process #{@integer} while @primes.size #{@primes.size} < quantity #{quantity}"}

      unless @integer.to_s.end_with?('5') or @composites.keys.include?(@integer)
        prime = @integer
        @primes[prime] = prime
        logger.debug {"Store #{prime} into @primes"}
        if prime < segment_size
          logger.debug {"Enumerate multiples of prime #{prime} in first segment and store into composites"}
          # Find the primes in the first (i.e. the lowest) segment, using the regular sieve.
          (prime ** 2).step(by: prime * 2, to: to) {|step| @composites[step] = step unless step < from or step.to_s.end_with?('5')}
        end
      end
      @integer += 2
      @integer += 2 if @integer.to_s.end_with?('5')
      if @integer >= to
        logger.debug {"End segment of size #{segment_size} from #{from} to #{to}"}
        from = to
        to += segment_size
        logger.debug {"Start segment of size #{segment_size} from #{from} to #{to}"}
        @composites = {}
        logger.debug {"Select primes for segment"}
        segment_primes = @primes.select {|key, value| key > 2 and key != 5 and key <= Integer.sqrt(to)}
        logger.debug {"Enumerate multiples of segment primes and store into composites"}
        segment_primes.each_key {|prime| (prime ** 2).step(by: prime * 2, to: to) {|step| @composites[step] = step unless step < from or step.to_s.end_with?('5')}}

        # Start from the lowest multiple of p between m - Δ and m
        # lowest = from / prime
        # segment_primes.each_key {|prime| (from / prime).floor*prime.step(by: prime * 2, to: to) {|step| @composites[step] = step unless step < from or step.to_s.end_with?('5')}}
      end
    end
    @primes
  end

  def generate_multiplication_table
    sorted_primes = @primes.keys.sort
    first_row = [''] + sorted_primes
    rows = [first_row]
    sorted_primes.each do |prime|
      row = [prime]
      first_row[1..].each do |column|
        row << column * prime
      end
      rows << row
    end
    rows
  end
end
