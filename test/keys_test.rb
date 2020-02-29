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

  def test_it_creates_individual_key
end
