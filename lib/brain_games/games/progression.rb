# frozen_string_literal: true

module BrainGames
  module Games
    class Progression < Base
      param :rules, default: -> { 'What number is missing in the progression?' }

      def call
        yield generate_round
      end

      private

      def generate_round
        progression = make_progression
        hidden_index = rand(0..(progression.size - 1))
        answer = progression[hidden_index]
        progression[hidden_index] = '..'
        question = progression.join(' ')
        Success([question.to_s, answer.to_s])
      end

      def make_progression
        progression_step = rand(1..10)
        progression_length = rand(5..10)
        initial_number = rand(0..100)

        Array.new(progression_length, initial_number).map.with_index do |num, index|
          num + (progression_step * index)
        end
      end
    end
  end
end
