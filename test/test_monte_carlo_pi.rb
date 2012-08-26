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

  def test_calculate_pi
    @mc_pi.calculate_pi
    assert_nil(@mc_pi.pi)

    @mc_pi.instance_variable_set("@darts_total", 4.0)
    @mc_pi.instance_variable_set("@darts_in_circle", 3.0)
    assert_equal(3.0, @mc_pi.calculate_pi)
  end

  def test_simulate
    iterations = 10
    assert_nil(@mc_pi.pi)
    @mc_pi.simulate(iterations) do |pi, total, circle|
      refute_nil(pi)
      assert_equal(iterations, total)
      assert_includes(0..iterations, circle)
    end
    refute_nil(@mc_pi.pi)
  end

  def test_error
    assert_nil(@mc_pi.error)

    @mc_pi.simulate() {}
    refute_nil(@mc_pi.error)
  end

end