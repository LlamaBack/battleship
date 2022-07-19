require './lib/board'
require './lib/ship'
require './lib/cell'

class Computer
  def initialize
    @board = Board.new
    @ship1 = Ship.new("Cruiser", 3)
    @ship2 = Ship.new("Submarine", 2)
    place_random_ships
  end

  def place_random_ships
    @comp_board.place_rand(ship1)
    @comp_board.place_rand(ship2)
  end
end
