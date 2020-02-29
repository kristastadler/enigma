require './test/test_helper'
require 'date'
require './lib/enigma'
require './lib/keys'

class KeysTest < Minitest::Test

  def test_it_exists
    keys = Keys.new("12345")

    assert_instance_of Keys, keys
  end

  def test_it_has_attributes
    keys = Keys.new("12345")

    assert_equal [1, 2, 3, 4, 5], keys.number
  end

  def test_it_can_create_individual_keys
    keys = Keys.new("12345")

    assert_equal 12, keys.create_a_key
    assert_equal 23, keys.create_b_key
    assert_equal 34, keys.create_c_key
    assert_equal 45, keys.create_d_key
  end

end
