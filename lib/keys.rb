class Keys
  attr_reader :number

  def initialize(number)
    @number = number.each_char.map(&:to_i)
  end

  def create_a_key
    a_key = []
    a_key << number[0]
    a_key << number[1]
    a_key = a_key.join.to_i
  end

  def create_b_key
    b_key = []
    b_key << number[1]
    b_key << number[2]
    b_key = b_key.join.to_i
  end

  def create_c_key
    c_key = []
    c_key << number[2]
    c_key << number[3]
    c_key = c_key.join.to_i
  end

  def create_d_key
    d_key = []
    d_key << number[3]
    d_key << number[4]
    d_key = d_key.join.to_i
  end
end
