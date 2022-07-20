require './lib/board'
require './lib/ship'
require './lib/cell'

class Computer
  attr_reader :board, :ships
  def initialize
    @board = Board.new
    @ship1 = Ship.new("Cruiser", 3)
    @ship2 = Ship.new("Submarine", 2)
    @ships = [@ship1, @ship2]
    place_random_ships
  end

  def place_random_ships
    @comp_board.place_rand(ship1)
    @comp_board.place_rand(ship2)
  end

  def fire_random_shot
    random_coord = keys[rand(keys.size)]
    cell = @board.cells[random_coord]
    # while cell.fired_upon do
    #   random_coord = keys[rand(keys.size)]
    # end
    if cell.fired_upon?
      fire_random_shot
    else
      if cell.empty?
        puts "My shot on #{random_coord} was a miss."
      elsif cell[random_coord].health == 1
        puts "My shot on #{random_coord} sank the #{cell.ship}!"
      elsif !cell.empty?
        puts "My shot on #{random_coord} was a hit!"
      end
      cell.fire_upon
    end
  end
end
