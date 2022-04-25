# frozen_string_literal: true

require 'tty-prompt'

ROUND_COUNT = 3

def play_game(rules, game)
  prompt = TTY::Prompt.new(help_color: :cyan)

  name = prompt.ask('May I have your name?') do |q|
    q.required true
    q.modify :capitalize
    q.modify :strip
  end

  prompt.say("Hello, #{name}!")
  prompt.say(rules)

  ROUND_COUNT.times do

    question, correct_answer = game.call
    prompt.say("Question: #{question}")
    user_answer = prompt.ask('Your answer:')

    if user_answer != correct_answer
      prompt.warn("'#{user_answer}' is wrong answer ;(. Correct answer was '#{correct_answer}'.")
      prompt.warn("Let's try again #{name}")
      return
    end
    prompt.ok('Correct!')
  end
  prompt.ok("Congratulations, #{name}!")
end
