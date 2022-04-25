# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/games/brain_gcd'
require 'minitest/pride'

class GcdTest < Minitest::Test
  def test_gcd
    assert_equal 4, gcd(92, 4)
  end
end
