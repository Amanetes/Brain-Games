# frozen_string_literal: true

def calculate(num1, num2, operator)
  case operator
  when '+' then num1 + num2
  when '-' then num1 - num2
  when '*' then num1 * num2
  when '/' then num1 / num2
  else
    raise "Operation #{operator} is not supported!"
  end
end

def run_calc
  generate_round = lambda do
    first_number = rand(1..100)
    second_number = rand(1..100)
    operator = %w[+ - * /].sample
    question = "#{first_number} #{operator} #{second_number}"
    answer = calculate(first_number, second_number, operator)
    [question, answer.to_s]
  end
  rules = 'What is the result of the expression?'
  play_game(rules, generate_round)
end
