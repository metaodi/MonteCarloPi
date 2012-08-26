require 'minitest/reporters'
require 'minitest/autorun'
require 'matrix'
require_relative "monte_carlo_pi"

MiniTest::Reporters.use!

class TestMonteCarloPi < MiniTest::Unit::TestCase

  def setup
    @mc_pi = MonteCarloPi.new
  end


  def teardown
    # Do nothing
  end

  def test_constructor
    assert_kind_of(MonteCarloPi, @mc_pi, "Object should be an instance of MonteCarloPi")
  end

  def test_random_coordinates
    coords = @mc_pi.generate_random_coordinates
    assert_kind_of(Vector, coords, "Coordinates should be an instance of Vector")
  end
end