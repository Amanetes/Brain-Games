# frozen_string_literal: true

require_relative '../engine'

def run_even
  generate_round = lambda {
    number = rand(1..100)
    question = number.to_s
    answer = number.even? ? 'yes' : 'no'
    [question, answer]
  }
  rules = 'Answer "yes" if the number is even, otherwise answer "no".'
  play_game(rules, generate_round)
end
