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

    assert_equal "12345", keys.number
  end

end
