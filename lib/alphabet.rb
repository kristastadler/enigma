class Alphabet
  attr_reader :letters

  def initialize
    @letters = ("a".."z").to_a << " "
  end

  def add_values
    numbers = (1..27)
    zipped = @letters.zip(numbers)
    alphabet_with_values = Hash[zipped]
  end

  def letter_value(letter)
    add_values[letter]
  end


  def find_key(value)
    add_values.key(value)
  end   

end
