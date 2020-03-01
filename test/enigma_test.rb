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
                 encryption: "keder ohulw",
                 key: "02715",
                 date: "040895"
                }

    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_encrypt_without_date_passed_in
    enigma = Enigma.new
    Date.stubs(:today).returns(Date.new(2020, 11, 04))

    expected = {
                 encryption: "nib udmcxpu",
                 key: "02715",
                 date: "041120"
                }

    assert_equal expected, enigma.encrypt("hello world", "02715")
  end

  def test_it_can_encrypt_without_date_or_key_passed_in
    enigma = Enigma.new
    Date.stubs(:today).returns(Date.new(2020, 11, 04))

    assert_instance_of Hash, enigma.encrypt("hello world")
  end


  def test_it_can_create_full_list_of_alphabet_values
    enigma = Enigma.new

    assert_equal 27, enigma.alphabet_with_values.length
  end

  def test_it_finds_alphabet_value
    enigma = Enigma.new

    assert_equal 21, enigma.alphabet_value("u")
    assert_equal 27, enigma.alphabet_value(" ")
    assert_equal 3, enigma.alphabet_value("c")
  end

  def test_it_can_encrypt_message
    enigma = Enigma.new

    assert_equal "keder ohulw", enigma.encrypt_message("hello world", "02715", "040895")
  end

end
