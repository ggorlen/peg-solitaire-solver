require "./bfs.rb"
require "./triangular_peg_solitaire.rb"


pegs = TriangularPegSolitaire.new([
  ["x"],
  ["x", "x"],
  ["x", "o", "x"],
  ["x", "x", "x", "x"],
  ["x", "x", "x", "x", "x"]
])

puts "start position:"
puts pegs
start = Time.now
solution = BFS.solve(pegs)

if solution
  puts "solved in #{Time.now - start} seconds using #{solution.size - 1} moves"
  solution.each { |position| puts position }
else
  puts "no solution for this position"
end
