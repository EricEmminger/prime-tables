class Number < ApplicationRecord
  attr_reader :primes, :composites, :integer
  validates :value, presence: true
  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  def initialize(*args)
    # @primes = []
    @primes = {}
    @composites = {}
    @integer = 2
    super
  end

  def generate_primes(quantity=3)
    # primes = Array.new(quantity)
    # composites = []
    # to = quantity ** 2
    # to = quantity * 50

    @composites = {}
    @integer = 3
    first = 2
    second = 3
    third = 5
    # @primes = {first:, third:}
    if quantity >= 1
      @primes[first] = first
    end
    if quantity >= 2
      @primes[second] = second
    end
    if quantity >= 3
      @primes[third] = third
    end
    # sequence = first.step(to: to)
    # [2, 3, 4, 5, 6, 7, 8, 9]
    # first.step(by: first)

    # Divide the range 2 through n into segments of some size Δ ≤ √n.
    segment_size = 1000
    from = @integer
    to = segment_size
    logger.debug {"Start segment of size #{segment_size} from #{from} to #{to} (first segment)"}
    while @primes.size < quantity
      logger.debug {"Process #{@integer} while @primes.size #{@primes.size} < quantity #{quantity}"}

      # unless @composites.keys.include?(@integer) or @integer.to_s.end_with?('5')
      unless @integer.to_s.end_with?('5') or @composites.keys.include?(@integer)
        prime = @integer
        @primes[prime] = prime
        logger.debug {"Store #{prime} into @primes"}
        if prime < segment_size
          logger.debug {"Enumerate multiples of prime #{prime} in first segment and store into composites"}
          # Find the primes in the first (i.e. the lowest) segment, using the regular sieve.
          # segment_primes = {}
          # segment_primes[prime] = prime
          # logger.debug {"segment_primes empty and store: #{prime}"}
          (prime ** 2).step(by: prime * 2, to: to) {|step| @composites[step] = step unless step < from or step.to_s.end_with?('5')}
        end
      end
        # step.even? or
        # unless @integer.to_s.end_with?('5')
        #   # step == @integer or
        # end
      # if [2, 5].include?(@integer)
      #   @primes[@integer] = @integer
      # elsif @integer > 2 and @integer.even?
        # every prime number other than 2 is an odd number
        # @composites << @integer
        # @composites[@integer] = @integer
      # elsif @integer > 5 and @integer.to_s.end_with?('5')
        # decimal numbers that end in 0 or 5 are divisible by 5
        # @composites << @integer
        # @composites[@integer] = @integer
      # else
        # all prime numbers larger than 5 end in 1, 3, 7, or 9
        # @integer.even? or 
      # end
      # @integer += 1
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
        # segment_primes = @primes.select {|key, value| key > 2 and key != 5 and key <= Math.sqrt(to)}
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
