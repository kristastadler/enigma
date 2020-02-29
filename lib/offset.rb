class Offset
  attr_reader :date

  def initialize(ddmmyy)
    @date = ddmmyy
  end

  def square
    integer = date.to_i
    integer * integer
  end

end
