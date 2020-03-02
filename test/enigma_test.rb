require './test/test_helper'
require 'date'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    skip
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_create_encryption_hash
    skip
    enigma = Enigma.new

    expected = {
                 encryption: "keder ohulw",
                 key: "02715",
                 date: "040895"
                }

    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_create_decryption_hash
    skip
    enigma = Enigma.new

    expected = {
                 decryption: "hello world",
                 key: "02715",
                 date: "040895"
                }

    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_without_date_passed_in
    skip
    enigma = Enigma.new
    Date.stubs(:today).returns(Date.new(2020, 11, 04))

    expected = {
                 encryption: "nib udmcxpu",
                 key: "02715",
                 date: "041120"
                }

    assert_equal expected, enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_without_date_passed_in
    skip
    enigma = Enigma.new
    Date.stubs(:today).returns(Date.new(2020, 11, 04))

    expected = {
                 decryption: "hello world",
                 key: "02715",
                 date: "041120"
                }

    assert_equal expected, enigma.decrypt("nib udmcxpu", "02715")
  end

  def test_it_can_create_random_key
    skip
    enigma = Enigma.new

    assert_instance_of String, enigma.create_random_key
    assert_equal 5, enigma.create_random_key.length
  end

  def test_it_can_encrypt_without_date_or_key_passed_in
    skip
    enigma = Enigma.new
    Date.stubs(:today).returns(Date.new(2020, 11, 04))

    assert_instance_of Hash, enigma.encrypt("hello world")
  end

  def test_it_finds_encryption_shift
    skip
    enigma = Enigma.new

    assert_instance_of Hash, enigma.encryption_shift("02715", "040895")
  end

  def test_it_finds_individual_shifts
    enigma = Enigma.new

    assert_equal 3, encryption_shift("02715", "040895")[:a_shift]
    assert_equal 27, encryption_shift("02715", "040895")[:b_shift]
    assert_equal 73, encryption_shift("02715", "040895")[:c_shift]
    assert_equal 20, encryption_shift("02715", "040895")[:d_shift]


  def test_it_creates_message_array
    skip
    enigma = Enigma.new

    assert_equal ["h", "e", "l", "l", "o"], enigma.create_message_array("hello")
  end

  def test_it_refactors_shift_value
    skip
    enigma = Enigma.new

    assert_equal 24, enigma.refactor_shift_value(78)
  end

  def test_it_can_encrypt_message
    skip
    enigma = Enigma.new

    assert_equal "keder ohulw", enigma.encrypt_message("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_message
    skip
    enigma = Enigma.new

    assert_equal "hello world", enigma.decrypt_message("keder ohulw", "02715", "040895")
  end
end
