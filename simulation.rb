require_relative 'monte_carlo_pi'

pi_calc = MonteCarloPi.new
puts pi_calc.simulate {|pi, total, in_circle| "Pi: #{pi}, Total darts: #{total}, In circle: #{in_circle}"}