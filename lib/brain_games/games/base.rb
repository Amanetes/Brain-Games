# frozen_string_literal: true

module BrainGames
  module Games
    class Base
      include Dry::Monads[:result, :do]
      extend Dry::Initializer

      def self.run
        new.call
      end
    end
  end
end
