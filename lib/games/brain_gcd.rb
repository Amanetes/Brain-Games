# frozen_string_literal: true

def gcd(num1, num2)
  return num1 if num2.zero?

  gcd(num2, num1 % num2)
end

def run_gcd
  generate_round = lambda {
    first_number = rand(1..100)
    second_number = rand(1..100)
    question = "#{first_number} #{second_number}"
    answer = gcd(first_number, second_number)
    [question, answer.to_s]
  }
  rules = 'Answer "yes" if the number is even, otherwise answer "no".'
  play_game(rules, generate_round)
end
