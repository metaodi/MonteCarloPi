require_relative 'coordinates'

class MonteCarloPi
  attr_reader :radius, :darts_total, :darts_in_circle, :pi

  def initialize(radius=1.0)
    @radius = radius
    @darts_total = 0.0
    @darts_in_circle = 0.0
    @pi = nil
  end

  private
  def generate_random_coordinates
    Coordinates.generate_within(@radius)
  end

  def calculate_pi
    if @darts_total > 0
      @pi = 4 * (@darts_in_circle / @darts_total)
    end
  end

  public
  def simulate(iterations=1000)
    iterations.times do
      coords = generate_random_coordinates
      if coords.in_circle(@radius)
        @darts_in_circle += 1.0
      end
      @darts_total += 1.0
    end
    calculate_pi
    yield(@pi, @darts_total, @darts_in_circle)
  end

  def error
    (@pi - Math::PI).abs if @pi
  end

end

