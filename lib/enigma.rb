require 'date'
require './lib/keys'
require './lib/offset'

class Enigma

  def initialize
  end

  def encrypt(message, key, date)
    encryption = {
                  encryption: nil,
                  key: key,
                  date: date
                }
    encryption
  end

  def encryption_shift(key, date)
    key = Keys.new(key)
    a_key = key.create_a_key
    b_key = key.create_b_key
    c_key = key.create_c_key
    d_key = key.create_d_key

    offset = Offset.new(date)
    a_offset = offset.find_a_offset
    b_offset = offset.find_b_offset
    c_offset = offset.find_c_offset
    d_offset = offset.find_d_offset

    b_shift = b_key + b_offset
    c_shift = c_key + c_offset
    d_shift = d_key + d_offset

    shift_hash = {
                  a_shift: a_key + a_offset,
                  b_shift: b_key + b_offset,
                  c_shift: c_key + c_offset,
                  d_shift: d_key + d_offset
                }
  end

  def alphabet_with_values
    alphabet_letters = ("a".."z").to_a << " "
    numbers = (1..27)
    zipped = alphabet_letters.zip(numbers)
    alphabet_values = Hash[zipped]
  end

  def alphabet_value(letter)
    alphabet_letters = ("a".."z").to_a << " "
    numbers = (1..27)
    zipped = alphabet_letters.zip(numbers)
    alphabet_values = Hash[zipped]
    alphabet_values[letter]
  end

  def encrypt_message(message, key, date)
    message_array = message.each_char.map(&:to_s)
    encryption_hash = encryption_shift(key, date)
    i = 0
    a_transform = {}
    b_transform = {}
    c_transform = {}
    d_transform = {}
    encrypted_message = []

    message_array.each do |letter|
      i += 1

      if 4/i == 4
        a_transform[letter] = alphabet_with_values.key(alphabet_value(letter) + encryption_hash[:a_shift])

      end

    end
  end

end
