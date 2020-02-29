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

end
