# frozen_string_literal: true

require 'dry-monads'
require 'dry-initializer'
require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup
module BrainGames
  def self.start
    BrainGames::Cli.call
  end
end
