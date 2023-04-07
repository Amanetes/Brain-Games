# frozen_string_literal: true

module BrainGames
  module Games
    class Calc < Base
      param :rules, default: -> { 'What is the result of the expression?' }

      def call
        yield generate_round
      end

      private

      def generate_round
        first_number = rand(1..100)
        second_number = rand(1..(100 - first_number)) # reduce the chance of division by zero
        operator = %w[+ - * /].sample
        question = "#{first_number} #{operator} #{second_number}"
        answer = yield calculate(first_number, second_number, operator)
        Success([question, answer.to_s])
      end

      def calculate(num1, num2, operator)
        result = case operator
                 when '+' then Success(num1 + num2)
                 when '-' then Success(num1 - num2)
                 when '*' then Success(num1 * num2)
                 when '/' then num2.zero? ? Failure('Division by zero is not allowed!') : Success(num1.to_f / num2)
                 else Failure("Operation #{operator} is not supported!")
                 end

        result.or do |error|
          raise error
        end
      end
    end
  end
end
