# Prime Tables - Coding Exercise

## How to run it
1. Start the Rails server
		rails server
2. Open http://localhost:3000/ and submit the form
3. Run the test suite
		rails test test/models/number_test.rb

## What you’re pleased with
1. Use Ruby 3.2.1 and Rails 7.0.4.2
2. Avoid a brute force / trial division algorithm (in other words, do not use
modulus (%) or divide (/) - you are recommended to use a sieve.)
3. Write your application with high unit test coverage with a test-driven approach
4. Use a web page for the input and output
5. Write an algorithm to solve the prime number generation - do not use a
library method to generate your primes
6. Validate user input is a whole number N, where N is at least 1
7. Output an N+1 x N+1 grid of numbers
8. Make a performant prime algorithm that can generate very large primes (think in terms of
an algorithm that can generate in excess of 100,000 primes, or the 1 millionth prime).
9. Build a simple solution with:
	- Simplicity and extensibility
	- Code Maintainability
	- Output, (format and accuracy)
	- a test-driven approach
	- loosely coupled and highly cohesive designs

## What you would do with it if you had more time
1. Write more tests, including timing of algorithm
2. Start from the lowest multiple of p between m - Δ and m
3. Refactor

------------

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
		ruby "3.2.1"

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite
		rails test

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
