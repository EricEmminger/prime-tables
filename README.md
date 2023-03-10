# Prime Tables - Coding Exercise

## How to run it
1. Start the Rails server
```
rails server
```
2. Open http://localhost:3000/ and submit the form
3. Run the test suite
```
rails test test/models/number_test.rb
```

## What you’re pleased with
- [x] Use Ruby 3.2.1 and Rails 7.0.4.2
- [x] Avoid a brute force / trial division algorithm (in other words, do not use
modulus (%) or divide (/) - you are recommended to use a sieve.)
- [x] Write your application with high unit test coverage with a test-driven approach
- [x] Use a web page for the input and output
- [x] Write an algorithm to solve the prime number generation - do not use a
library method to generate your primes
- [x] Validate user input is a whole number N, where N is at least 1
- [x] Output an N+1 x N+1 grid of numbers
- [x] Make a performant prime algorithm that can generate very large primes (think in terms of
an algorithm that can generate in excess of 100,000 primes, or the 1 millionth prime).
- [x] Build a simple solution with:
	- [x] Simplicity and extensibility
	- [x] Code Maintainability
	- [x] Output, (format and accuracy)
	- [x] a test-driven approach
	- [x] loosely coupled and highly cohesive designs

## What you would do with it if you had more time
- [ ] Write more tests, including timing of algorithm
- [ ] Start from the lowest multiple of p between m - Δ and m
- [ ] Refactor

------------

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
