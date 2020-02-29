require './test/test_helper'
require 'date'
require './lib/enigma'
require './lib/keys'
require './lib/offset'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new("040895")

    assert_instance_of Offset, offset
  end

  def test_it_has_attributes
    offset = Offset.new("040895")

    assert_equal "040895", offset.date
  end

  def test_it_can_square_date
    offset = Offset.new("040895")

    assert_equal 1672401025, offset.square
  end

  def test_it_finds_last_four_digits
    offset = Offset.new("040895")

    assert_equal 1025, offset.last_four_digits
  end

end
