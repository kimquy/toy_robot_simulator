class State
  attr_accessor :x, :y, :facing, :error

  def initialize(x = 0, y = 0, facing = nil)
    @x = x
    @y = y
    @facing = facing
  end

  def to_s
    facing.nil? ? "" : "#{x},#{y},#{facing}"
  end
end
