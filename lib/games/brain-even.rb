# frozen_string_literal: true

def game_result
  rules = 'Answer "yes" if the number is even, otherwise answer "no".'
  number = rand(1..100)
  question = number
  answer = number.even? ? 'yes' : 'no'
  [question, answer]
end
