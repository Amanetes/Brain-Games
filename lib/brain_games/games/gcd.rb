# frozen_string_literal: true

module BrainGames
  module Games
    class Gcd < Base
      param :rules, default: -> { 'Find the greatest common divisor of given numbers.' }
      def call
        yield generate_round
      end

      private

      def generate_round
        first_number = rand(1..100)
        second_number = rand(1..100)
        question = "#{first_number} #{second_number}"
        answer = first_number.gcd(second_number)
        Success([question, answer.to_s])
      end
    end
  end
end
