# frozen_string_literal: true

def prime?(num)
  false if num < 2
  (2..Math.sqrt(num)).none? { |i| (num % i).zero? }
end

def run_prime
  generate_round = lambda {
    number = rand(1..100)
    question = number.to_s
    answer = prime?(number) ? 'yes' : 'no'
    [question, answer]
  }
  rules = 'Answer "yes" if given number is prime. Otherwise answer "no"'
  play_game(rules, generate_round)
end