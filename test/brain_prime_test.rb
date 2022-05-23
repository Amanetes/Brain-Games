# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/games/brain_prime'
require 'minitest/pride'

class PrimeTest < Minitest::Test
  def test_prime
    assert_equal true, prime?(11)
    assert_equal false, prime?(52)
  end
end
