class State
  attr_accessor :x, :y, :facing

  def initialize(x = 0, y = 0, facing = nil)
    @x = x
    @y = y
    @facing = facing
  end

  def to_s
    facing.nil? ? "" : "#{x},#{y},#{facing}"
  end
end
