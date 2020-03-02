require 'date'
require './lib/keys'
require './lib/offset'
require './lib/alphabet'

class Enigma

  def initialize
  end

  def encrypt(message, key = create_random_key, date = Date.today.strftime('%d%m%y'))
    encryption = {
                  encryption: encrypt_message(message, key, date),
                  key: key,
                  date: date
                }
    encryption
  end

  def decrypt(message, key, date = Date.today.strftime('%d%m%y'))
    decryption = {
                  decryption: "hello world",
                  key: key,
                  date: date
                  }
  end

  def create_random_key
    key = Array.new(5){rand(0..9)}
    key.map(&:to_s).join
  end

  def encryption_shift(key, date)
    key = Keys.new(key)
    offset = Offset.new(date)

    shift_hash = {
                  a_shift: key.create_a_key + offset.find_a_offset,
                  b_shift: key.create_b_key + offset.find_b_offset,
                  c_shift: key.create_c_key + offset.find_c_offset,
                  d_shift: key.create_d_key + offset.find_d_offset
                }
  end

  def encrypt_message(message, key, date)
    message_array = message.each_char.map(&:to_s)
    alphabet = Alphabet.new

    i = 0
    a_transform = {}
    b_transform = {}
    c_transform = {}
    d_transform = {}
    encrypted_message = []

    message_array.each do |letter|
      i += 1
      if i == 1 || i == 5 || i == 9
        if encryption_shift(key, date)[:a_shift] == 27
          letter = a_transform[letter] = letter
          encrypted_message << letter
        else
          shift_value = alphabet.letter_value(letter) + encryption_shift(key, date)[:a_shift]
          if shift_value > 27
            x = shift_value / 27
            y = 27 * x
            shift_value = shift_value - y
            letter = a_transform[letter] = alphabet.find_key(shift_value)
            encrypted_message << letter
          else
            letter = a_transform[letter] = alphabet.find_key(shift_value)
            encrypted_message << letter
          end
        end
      elsif i == 2 || i == 6 || i == 10
        if encryption_shift(key, date)[:b_shift] == 27
          letter = b_transform[letter] = letter
          encrypted_message << letter
        else
          shift_value = alphabet.letter_value(letter) + encryption_shift(key, date)[:b_shift]
          if shift_value > 27
            x = shift_value / 27
            y = 27 * x
            shift_value = shift_value - y
            letter = a_transform[letter] = alphabet.find_key(shift_value)
            encrypted_message << letter
          else
            letter = b_transform[letter] = alphabet.find_key(shift_value)
            encrypted_message << letter
          end
        end
      elsif i == 3 || i == 7 || i == 11
        if encryption_shift(key, date)[:c_shift] == 27
          letter = c_transform[letter] = letter
          encrypted_message << letter
        else
          shift_value = alphabet.letter_value(letter) + encryption_shift(key, date)[:c_shift]
          if shift_value > 27
            x = shift_value / 27
            y = 27 * x
            shift_value = shift_value - y
            letter = a_transform[letter] = alphabet.find_key(shift_value)
            encrypted_message << letter
          else
            letter = c_transform[letter] = alphabet.find_key(shift_value)
            encrypted_message << letter
          end
        end
      elsif i == 4 || i == 8 || i == 12
        if encryption_shift(key, date)[:d_shift] == 27
          letter = d_transform[letter] = letter
          encrypted_message << letter
        else
          shift_value = alphabet.letter_value(letter) + encryption_shift(key, date)[:d_shift]
          if shift_value > 27
            x = shift_value / 27
            y = 27 * x
            shift_value = shift_value - y
            letter = a_transform[letter] = alphabet.find_key(shift_value)
            encrypted_message << letter
          else
            letter = d_transform[letter] = alphabet.find_key(shift_value)
            encrypted_message << letter
          end
        end
      end
    end
    encrypted_message.join
  end

  def decrypt_message(message, key, date)
    message_array = message.each_char.map(&:to_s)
    alphabet = Alphabet.new

    i = 0
    a_transform = {}
    b_transform = {}
    c_transform = {}
    d_transform = {}
    encrypted_message = []

    message_array.each do |letter|
      i += 1
      if i == 1 || i == 5 || i == 9
        if encryption_shift(key, date)[:a_shift] == 27
          letter = a_transform[letter] = letter
          encrypted_message << letter
        else
          shift_value = alphabet.letter_value(letter) - encryption_shift(key, date)[:a_shift]
          if shift_value < 27
            x = shift_value / 27
            y = 27 * x
            shift_value = shift_value - y
            letter = a_transform[letter] = alphabet.find_key(shift_value)
            encrypted_message << letter
          else
            letter = a_transform[letter] = alphabet.find_key(shift_value)
            encrypted_message << letter
          end
        end
      elsif i == 2 || i == 6 || i == 10
        if encryption_shift(key, date)[:b_shift] == 27
          letter = b_transform[letter] = letter
          encrypted_message << letter
        else
          shift_value = alphabet.letter_value(letter) - encryption_shift(key, date)[:b_shift]
          if shift_value < 27
            x = shift_value / 27
            y = 27 * x
            shift_value = shift_value - y
            letter = a_transform[letter] = alphabet.find_key(shift_value)
            encrypted_message << letter
          else
            letter = b_transform[letter] = alphabet.find_key(shift_value)
            encrypted_message << letter
          end
        end
      elsif i == 3 || i == 7 || i == 11
        if encryption_shift(key, date)[:c_shift] == 27
          letter = c_transform[letter] = letter
          encrypted_message << letter
        else
          shift_value = alphabet.letter_value(letter) - encryption_shift(key, date)[:c_shift]
            if shift_value < 0
            x = shift_value / 27
            y = 27 * x
            shift_value = shift_value - y
            letter = a_transform[letter] = alphabet.find_key(shift_value)
            encrypted_message << letter
          else
            letter = c_transform[letter] = alphabet.find_key(shift_value)
            encrypted_message << letter
          end
        end
      elsif i == 4 || i == 8 || i == 12
        if encryption_shift(key, date)[:d_shift] == 27
          letter = d_transform[letter] = letter
          encrypted_message << letter
        else
          shift_value = alphabet.letter_value(letter) - encryption_shift(key, date)[:d_shift]
          if shift_value < 0
            x = shift_value / 27
            y = 27 * x
            shift_value = shift_value - y
            letter = d_transform[letter] = alphabet.find_key(shift_value)
            encrypted_message << letter
          else
            letter = d_transform[letter] = alphabet.find_key(shift_value)
            encrypted_message << letter
          end
        end
      end
    end
    encrypted_message.join
  end

end
