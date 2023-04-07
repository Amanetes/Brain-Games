# frozen_string_literal: true

module BrainGames
  class Engine
    extend Dry::Initializer
    include Dry::Monads[:result]

    def self.call(...)
      new(...).call
    end

    param :game
    param :round_count, default: -> { 3 }

    def call
      play_game
    end

    private

    def play_game
      player_name = ask_name
      prompt.say("Hello, #{player_name}!")
      show_rules(game)
      round_count.times do
        play_round(game, player_name)
      end
      win_message(player_name)
    end

    def ask_name
      prompt.ask('May I have your name?') do |q|
        q.required true
        q.modify :capitalize
        q.modify :strip
      end
    end

    def play_round(game, player_name)
      question, correct_answer = game.run
      prompt.say("Question: #{question}")
      user_answer = prompt.ask('Your answer:')
      if check_answer(user_answer, correct_answer)
        Success(correct_message)
      else
        Failure(wrong_message(user_answer, correct_answer, player_name))
        exit
      end
    end

    def check_answer(user_answer, correct_answer)
      user_answer == correct_answer
    end

    def show_rules(game)
      prompt.say(game.new.rules)
    end

    def correct_message
      prompt.ok('Correct!')
    end

    def wrong_message(user_answer, correct_answer, player_name)
      prompt.warn("'#{user_answer}' is wrong answer ;(. Correct answer was '#{correct_answer}'.")
      prompt.warn("Let's try again #{player_name}")
    end

    def win_message(player_name)
      prompt.ok("Congratulations, #{player_name}!")
    end

    def prompt
      @prompt ||= TTY::Prompt.new(help_color: :cyan)
    end
  end
end
