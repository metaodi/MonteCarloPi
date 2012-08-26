require 'minitest/reporters'
require 'minitest/autorun'
require_relative "../monte_carlo_pi"

MiniTest::Reporters.use!

class TestMonteCarloPi < MiniTest::Unit::TestCase

  def setup
    # make private methods accessible for tests
    MonteCarloPi.send(:public, *MonteCarloPi.private_instance_methods)
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
    assert_kind_of(Coordinates, @coords, "Coordinates should be an instance of Coordinates")
  end

  def test_random_coordinates_range
    assert_includes 0.0..1.0, @coords.x
    assert_includes 0.0..1.0, @coords.y
  end
end