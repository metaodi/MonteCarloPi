require_relative 'monte_carlo_pi'

# run Monte Carlo simulation with 100000 iterations
monte_carlo_pi = MonteCarloPi.new
puts monte_carlo_pi.simulate(100000) {|pi, total, in_circle| "Pi: #{pi}, Total darts: #{total}, In circle: #{in_circle}"}

# print error
puts "Error: #{monte_carlo_pi.error}"