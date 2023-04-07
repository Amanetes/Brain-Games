# frozen_string_literal: true

require 'tty-prompt'
module BrainGames
  module Games
    class Even < Base
      param :rules, default: -> { 'Answer "yes" if the number is even, otherwise answer "no".' }

      def call
        yield generate_round
      end

      private

      def generate_round
        number = rand(1..100)
        question = number.to_s
        answer = number.even? ? 'yes' : 'no'
        Success([question, answer])
      end
    end
  end
end
