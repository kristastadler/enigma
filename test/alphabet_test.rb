require './test/test_helper'
require 'date'
require './lib/enigma'
require './lib/keys'
require './lib/offset'
require './lib/alphabet'

class AlphabetTest < Minitest::Test

  def test_it_exists
    alphabet = Alphabet.new

    assert_instance_of Alphabet, alphabet
  end

  def test_it_has_attributes
    alphabet = Alphabet.new

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, alphabet.letters
  end

  def test_it_adds_values
    alphabet = Alphabet.new

    expected = {
                "a" => 1,
                "b" => 2,
                "c" => 3,
                "d" => 4,
                "e" => 5,
                "f" => 6,
                "g" => 7,
                "h" => 8,
                "i" => 9,
                "j" => 10,
                "k" => 11,
                "l" => 12,
                "m" => 13,
                "n" => 14,
                "o" => 15,
                "p" => 16,
                "q" => 17,
                "r" => 18,
                "s" => 19,
                "t" => 20,
                "u" => 21,
                "v" => 22,
                "w" => 23,
                "x" => 24,
                "y" => 25,
                "z" => 26,
                " " => 27
              }
    assert_equal expected, alphabet.add_values
  end

  def test_it_can_locate_letter_value
    alphabet = Alphabet.new

    assert_equal 21, alphabet.letter_value("u")
    assert_equal 27, alphabet.letter_value(" ")
    assert_equal 3, alphabet.letter_value("c")
  end

  def test_it_can_find_key_by_value
    alphabet = Alphabet.new

    assert_equal "u", alphabet.find_key(21)
    assert_equal " ", alphabet.find_key(27)
    assert_equal "c", alphabet.find_key(3)
  end

end
