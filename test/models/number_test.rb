require "test_helper"

class NumberTest < ActiveSupport::TestCase
  def setup
    @number = Number.new
  end

  def audit(quantity, expected=nil)
    @number.generate_primes(quantity)
    assert_equal quantity, @number.primes.size, "Expected primes size to equal quantity #{quantity}"
    sorted_primes = @number.primes.keys.sort
    puts "\n#{quantity} primes: #{sorted_primes}\n- composites: #{@number.composites.keys.sort}"
    last = sorted_primes.last
    puts "\n#{quantity}th prime: #{last}"
    assert_equal expected, last, "Expected #{quantity}th prime number to be #{expected}" if expected
  end

  test 'does not use a brute force / trial division algorithm' do
  end

  test 'generates primes' do
    # The first 25 prime numbers (all the prime numbers less than 100) are:
    # 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97

    #
    quantity = 0
    audit(quantity)
    assert_equal quantity, @number.primes.size, "Expected primes size to equal quantity #{quantity}"
    quantity = 3
    audit(quantity, 5)
    assert_equal [2, 3, 5], @number.primes.keys.sort, "Expected #{quantity} primes to equal [2, 3, 5]"
    quantity = 4
    audit(quantity, 7)
    assert_equal [2, 3, 5, 7], @number.primes.keys.sort, "Expected #{quantity} primes to equal [2, 3, 5, 7]"
    quantity = 5
    audit(quantity, 11)
    assert_equal [2, 3, 5, 7, 11], @number.primes.keys.sort, "Expected #{quantity} primes to equal [2, 3, 5, 7, 11]"
    quantity = 25
    audit(quantity, 97)
    assert_equal [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97], @number.primes.keys.sort, "Expected #{quantity} primes to equal [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]"
  end

  test 'generates very large primes' do
    # quantity = 25000 # 287117
    # quantity = 100000
    # 1299709
    # 4999997
    # audit(1000, 7919) # 0.173152s
    # audit(10000, 104729) # 10.331881s
    # audit(10000, 104729) # 1.142215s
    # https://www.bigprimes.net/archive/prime/100000
    # audit(100000, 1299709) # 1179.733895s
    # audit(100000, 1299709) # 18306.095500s
    audit(100000, 1299709) # 44.055660s
    # https://www.bigprimes.net/archive/prime/1000000
    # audit(1000000, 15485863) # 5616.036912s
  end

  test 'user should input a whole number N where N is at least 1' do
    assert_nil @number.value, 'Expected value to be nil'
    assert_not @number.save, 'Expected number without a value to not save'
    fraction = 0.9
    @number.value = fraction
    assert @number.invalid?, 'Expected fractional value to be invalid'
    negative = -2
    @number.value = negative
    assert @number.invalid?, 'Expected negative value to be invalid'
    zero = 0
    @number.value = zero
    assert @number.invalid?, 'Expected zero value to be invalid'
    least = 1
    @number.value = least
    assert @number.valid?, 'Expected value at least 1 to be valid'
    assert_not_nil @number.value, 'Expected value to be not nil'
  end

  test 'application should output an N+1 x N+1 grid of numbers' do
  end
end
