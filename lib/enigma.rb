require 'date'
require './lib/keys'
require './lib/offset'
require './lib/alphabet'

class Enigma
  attr_reader :encrypted_message,
              :decrypted_message

  def initialize
    @encrypted_message = []
    @decrypted_message = []
  end

  def encrypt(message, key = create_random_key, date = Date.today.strftime('%d%m%y'))
    encryption = {
                  encryption: encrypt_message(message, key, date),
                  key: key,
                  date: date
                }
  end

  def decrypt(message, key, date = Date.today.strftime('%d%m%y'))
    decryption = {
                  decryption: decrypt_message(message, key, date),
                  key: key,
                  date: date
                  }
  end

  def create_random_key
    key = Array.new(5){rand(0..9)}
    key.map(&:to_s).join
  end

  def final_shift(key, date)
    key = Keys.new(key)
    offset = Offset.new(date)

    shift_hash = {
                  a_shift: key.create_a_key + offset.find_a_offset,
                  b_shift: key.create_b_key + offset.find_b_offset,
                  c_shift: key.create_c_key + offset.find_c_offset,
                  d_shift: key.create_d_key + offset.find_d_offset
                }
  end

  def create_message_array(message)
    message.each_char.map(&:to_s)
  end

  def refactor_shift_value(shift_value)
    x = shift_value / 27
    y = 27 * x
    shift_value = shift_value - y
  end

  def encrypt_letter(key, date, letter, shift_by)
    alphabet = Alphabet.new
    if final_shift(key, date)[shift_by] == 27
      @encrypted_message << letter
    else
      shift_value = alphabet.letter_value(letter) + final_shift(key, date)[shift_by]
      if shift_value > 27
        new_letter = alphabet.find_key(refactor_shift_value(shift_value))
        @encrypted_message << new_letter
      else
        new_letter = alphabet.find_key(shift_value)
        @encrypted_message << new_letter
      end
    end
    new_letter
  end

  def encrypt_message(message, key, date)
    message = message.downcase
    i = 0
    create_message_array(message).each do |letter|
      i += 1
      if i == 1 || i == 5 || i == 9 || i == 13 || i == 17 || i == 21
        encrypt_letter(key, date, letter, :a_shift)
      elsif i == 2 || i == 6 || i == 10 || i == 14 || i == 18 || i == 22
        encrypt_letter(key, date, letter, :b_shift)
      elsif i == 3 || i == 7 || i == 11 || i == 15 || i == 19 || i == 23
        encrypt_letter(key, date, letter, :c_shift)
      elsif i == 4 || i == 8 || i == 12 || i == 16 || i == 20 || i == 24
        encrypt_letter(key, date, letter, :d_shift)
      end
    end
    @encrypted_message.join
  end

  def decrypt_letter(key, date, letter, shift_by)
    alphabet = Alphabet.new
    if final_shift(key, date)[shift_by] == 27
      @decrypted_message << letter
    else
      shift_value = alphabet.letter_value(letter) - final_shift(key, date)[shift_by]
      if shift_value < 0
        new_letter = alphabet.find_key(refactor_shift_value(shift_value))
        @decrypted_message << new_letter
      else
        new_letter = alphabet.find_key(shift_value)
        @decrypted_message << new_letter
      end
    end
    new_letter
  end

  def decrypt_message(message, key, date)
    message = message.downcase
    i = 0
    create_message_array(message).each do |letter|
      i += 1
      if i == 1 || i == 5 || i == 9 || i == 13 || i == 17 || i == 21
        decrypt_letter(key, date, letter, :a_shift)
      elsif i == 2 || i == 6 || i == 10 || i == 14 || i == 18 || i == 22
        decrypt_letter(key, date, letter, :b_shift)
      elsif i == 3 || i == 7 || i == 11 || i == 15 || i == 19 || i == 23
        decrypt_letter(key, date, letter, :c_shift)
      elsif i == 4 || i == 8 || i == 12 || i == 16 || i == 20 || i == 24
        decrypt_letter(key, date, letter, :d_shift)
      end
    end
    @decrypted_message.join
  end

end
