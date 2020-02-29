require './test/test_helper'
require 'date'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_create_encryption_hash
    enigma = Enigma.new

    expected = {
                 encryption: nil,
                 key: "02715",
                 date: "040895"
                }

    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

end
