class Board
  attr_reader :x_dimension, :y_dimension

  def initialize(x_dimension, y_dimension)
    @x_dimension = x_dimension
    @y_dimension = y_dimension
  end

  def off_board?(x, y)
    x.negative? ||
    y.negative? ||
    x >= x_dimension ||
    y >= y_dimension
  end
end
