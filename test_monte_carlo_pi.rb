require 'minitest/reporters'
require 'minitest/autorun'
require 'matrix'
require_relative "monte_carlo_pi"

MiniTest::Reporters.use!

class TestMonteCarloPi < MiniTest::Unit::TestCase

  def setup
    @mc_pi = MonteCarloPi.new
    @coords = @mc_pi.generate_random_coordinates
  end


  def teardown
    # Do nothing
  end

  def test_constructor
    assert_kind_of(MonteCarloPi, @mc_pi, "Object should be an instance of MonteCarloPi")
  end

  def test_random_coordinates
    assert_kind_of(Vector, @coords, "Coordinates should be an instance of Vector")
  end

  def test_random_coordinates_size
    @coords = @mc_pi.generate_random_coordinates
    assert_equal(2, @coords.size)
  end

  def test_random_coordinates_range
    assert_includes 0.0..1.0, @coords[0]
    assert_includes 0.0..1.0, @coords[1]
  end
end