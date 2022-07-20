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
    @board.place_rand(@ship1)
    @board.place_rand(@ship2)
  end

  def fire_random_shot
    keys = @board.cells.keys
    random_coord = keys[rand(keys.size)]
    cell = @board.cells[random_coord]
    # while cell.fired_upon do
    #   random_coord = keys[rand(keys.size)]
    # end
    if cell.fired_upon?
      fire_random_shot
    else
      cell.fire_upon
      if cell.empty?
        return "Your shot on #{random_coord} was a miss."
      elsif cell.ship.health == 1
        return "Your shot on #{random_coord} sank the #{cell.ship.name}!"
      elsif !cell.empty?
        return "Your shot on #{random_coord} was a hit!"
      end
    end
  end

  def fire_shot(coord)
    cell = @board.cells[coord]
    if cell.fired_upon?
      return "You have already shot on #{coord}. Please pay attention."
    end

    cell.fire_upon
    if cell.empty?
      return "Your shot on #{coord} was a miss."
    elsif cell.ship.health == 1
      return "Your shot on #{coord} sank the #{cell.ship.name}!"
    elsif !cell.empty?
      return "Your shot on #{coord} was a hit!"
    end

  end
end
