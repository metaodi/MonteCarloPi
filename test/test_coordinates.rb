require 'minitest/reporters'
require 'minitest/autorun'
require_relative "../monte_carlo_pi"

MiniTest::Reporters.use!

class TestCoordinates < MiniTest::Unit::TestCase

  def setup
    @coords1 = Coordinates.new(0,1)
    @coords2 = Coordinates.new(1,0)
    @coords3 = Coordinates.new(1,1)
  end

  def teardown
    # Do nothing
  end

  def test_constructor
    assert_kind_of(Coordinates, @coords1, "Coordinates should be an instance of Coordinates")
  end

  def test_generate_within_same_param
    coords = Coordinates.generate_within(5);
    assert_includes 0..5, coords.x
    assert_includes 0..5, coords.y
  end

  def test_generate_within
    coords = Coordinates.generate_within(10,5);
    assert_includes 0..10, coords.x
    assert_includes 0..5, coords.y
  end

  def test_distance_to_origin
    assert_equal(1, @coords1.distance_to_origin);
    assert_equal(1, @coords2.distance_to_origin);
    assert_equal(Math.sqrt(2), @coords3.distance_to_origin);
  end

  def test_in_circle
    radius = 1.0
    assert(@coords1.in_circle(radius));
    assert(@coords2.in_circle(radius));
    refute(@coords3.in_circle(radius));

    radius = 2.0
    assert(@coords3.in_circle(radius));
  end

end