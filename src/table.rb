# Class represents 4x4 table
class Table
  attr_reader :max_x, :max_y
  attr_reader :min_x, :min_y

  def initialize(max_x = 4, max_y = 4)
    @min_x = 0
    @min_y = 0
    @max_x = max_x
    @max_y = max_y
  end
end
