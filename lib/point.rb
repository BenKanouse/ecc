class Point
  attr_accessor :x, :y
  def initialize(x,y)
    self.x = x.to_f
    self.y = y.to_f
  end

  def ==(other)
    x == other.x && y == other.y
  end

  def to_s
    "(#{x}, #{y})"
  end
end
