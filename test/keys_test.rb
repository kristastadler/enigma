require './test/test_helper'
require 'date'
require './lib/key'

class KeysTest < Minitest::Test

  def test_it_exists
    keys1 = Keys.new

    assert_instance_of Keys, keys1
  end

  def test_it_has_attributes
    keys1 = Keys.new

    assert_equal [], keys1.encryption_array
  end

  def test_it_creates_encryption_array
    keys1 = Keys.new
    keys2 = Keys.new
    require "pry"; binding.pry

    assert_equal [47821], keys1.create_encryption_array(47821)
    assert_instance_of Array, keys2.create_encryption_array
  end

  def test_it_creates_individual_keys
    keys1 = Keys.new
    keys1.create_encryption_array(47821)
    keys2 = Keys.new
    keys2.create_encryption_array

    assert_equal 47, keys1.create_a_key
    assert_equal 78, keys1.create_b_key
    assert_equal 82, keys1.create_c_key
    assert_equal 21, keys1.create_d_key

    assert_equal 2, keys1.create_a_key.length
    assert_equal 2, keys1.create_b_key.length
    assert_equal 2, keys1.create_c_key.length
    assert_equal 2, keys1.create_d_key.length
  end








end
