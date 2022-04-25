# frozen_string_literal: true

def run_gcd
  generate_round = lambda do
    first_number = rand(1..100)
    second_number = rand(1..100)
    question = "#{first_number} #{second_number}"
    answer = first_number.gcd(second_number)
    [question, answer.to_s]
  end
  rules = 'Answer "yes" if the number is even, otherwise answer "no".'
  play_game(rules, generate_round)
end
