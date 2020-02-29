class Keys
  attr_reader :encryption_array

  def initialize
    @encryption_array = []
  end

  def create_encryption_array(array = nil)
    if array == nil
      Array.new(5){rand(0..9)}
    else
      encryption_array << array
    end
  end

end
