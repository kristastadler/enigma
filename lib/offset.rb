class Offset
  attr_reader :date

  def initialize(ddmmyy)
    @date = ddmmyy
  end

  def square
    integer = date.to_i
    date_squared = integer * integer
    date_squared = date_squared.to_s
  end

  def last_four_digits
    final_4_digits = []

    final_4_digits << square.each_char.map(&:to_i)[-4]
    final_4_digits << square.each_char.map(&:to_i)[-3]
    final_4_digits << square.each_char.map(&:to_i)[-2]
    final_4_digits << square.each_char.map(&:to_i)[-1]

    final_4_digits.join.to_i
  end
end
