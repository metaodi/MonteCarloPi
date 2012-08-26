require_relative 'coordinates'

class MonteCarloPi
  @@radius = 1.0
  attr_reader :darts_total, :darts_in_circle, :pi

  def initialize
    @darts_total = 0.0
    @darts_in_circle = 0.0
    @pi = 0.0
  end

  private
  def generate_random_coordinates
    Coordinates.new(Random.rand(@@radius), Random.rand(@@radius))
  end

  def calculate_pi
    @pi = 4 * (@darts_in_circle / @darts_total)
  end

  public
  def simulate(iterations=1000)
    iterations.times do
      coords = generate_random_coordinates
      if (coords.in_circle(@@radius))
        @darts_in_circle += 1.0
      end
      @darts_total += 1.0
    end
    calculate_pi
    yield(@pi, @darts_total, @darts_in_circle)
  end
end

