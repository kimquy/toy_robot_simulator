class State
  attr_accessor :x, :y, :facing, :error

  def initialize(x = 0, y = 0, facing = "NORTH", error: false)
    @x = x
    @y = y
    @facing = facing
    @error = error
  end

  def to_s
    @error ? "" : "#{x},#{y},#{facing}"
  end
end
