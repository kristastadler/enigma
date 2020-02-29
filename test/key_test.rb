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

    assert_equal [], key1.encryption_array
  end

  def test_it_creates_key_encryption_array
    key1 = Key.new
    key2 = Key.new
    key2.stubs(:create_encryption_array).returns(03291)

    assert_equal [47821], key1.create_encryption_array(47821)
    assert_equal [03291], key2.create_encryption_array 
  end

end
