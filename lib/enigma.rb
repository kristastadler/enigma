require 'date'
require './lib/keys'
require './lib/offset'

class Enigma
  attr_reader :a_shift,
              :b_shift,
              :c_shift,
              :d_shift

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

    @a_shift = a_key + a_offset
    @b_shift = b_key + b_offset
    @c_shift = c_key + c_offset
    @d_shift = d_key + d_offset
  end

  def encrypt_message(message, key, date)
    alphabet_array = ("a".."z").to_a << " "
    message_array = message.each_char.map(&:to_s)
    encryption_shift(key, date)
    require "pry"; binding.pry

  end

end
