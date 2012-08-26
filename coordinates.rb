class Coordinates
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def distance_to_origin
    Math.sqrt(x**2 + y**2)
  end

  def in_circle(radius)
    distance_to_origin <= radius
  end
end