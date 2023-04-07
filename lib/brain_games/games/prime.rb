# frozen_string_literal: true

module BrainGames
  module Games
    class Prime < Base
      param :rules, default: -> { 'Answer "yes" if given number is prime. Otherwise answer "no"' }
      def call
        yield generate_round
      end

      private

      def generate_round
        number = rand(1..100)
        question = number.to_s
        answer = prime?(number) ? 'yes' : 'no'
        Success([question, answer])
      end

      def prime?(num)
        false if num < 2
        (2..Math.sqrt(num)).none? { |i| (num % i).zero? }
      end
    end
  end
end
