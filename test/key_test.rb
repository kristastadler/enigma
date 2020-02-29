require './test/test_helper'
require 'date'
require './lib/key'

class KeyTest < Minitest::Test

  def test_it_exists
    key1 = Key.new

    assert_instance_of Key, key1
  end

  def test_it_has_attributes
    key1 = Key.new

    assert_equal [], key1.encryption_string
  end

end
