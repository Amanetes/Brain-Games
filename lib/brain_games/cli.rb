# frozen_string_literal: true

require 'tty-prompt'

module BrainGames
  class Cli
    include Dry::Monads[:result]
    extend Dry::Initializer

    GAMES = {
      'Brain-Even' => BrainGames::Games::Even,
      'Brain-Calc' => BrainGames::Games::Calc,
      'Brain-GCD' => BrainGames::Games::Gcd,
      'Brain-Prime' => BrainGames::Games::Prime,
      'Brain-Progression' => BrainGames::Games::Progression
    }.freeze

    option :prompt, default: -> { TTY::Prompt.new(help_color: :cyan) }
    def self.call
      new.call
    end

    def call
      welcome
      choose_game.bind { |game| BrainGames::Engine.call(game) }
    end

    private

    def choose_game
      game_name = prompt.select('Select game to start playing:', show_help: :always) do |menu|
        GAMES.each_key { |name| menu.choice name }
      end

      if GAMES.key?(game_name)
        Success(GAMES[game_name])
      else
        Failure('Game is not available!')
      end
    end

    def welcome
      prompt.say('Welcome to the Brain Games!')
    end
  end
end
