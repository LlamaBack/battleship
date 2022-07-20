require './lib/board'
require './lib/ship'
require './lib/cell'

class Computer
  attr_reader :board, :ships
  def initialize(row = 4, col = 4, ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)])
    @board = Board.new(row, col)
    @ships = ships
    place_random_ships
  end

  def place_random_ships
    @ships.map {|ship| @board.place_rand(ship)}
  end

  def fire_shot(coord)
    cell = @board.cells[coord]
    if cell.fired_upon?
      return "You have already shot on #{coord}."
    end

    cell.fire_upon

    if cell.empty?
      return "Your shot on #{coord} was a miss."
    elsif cell.ship.sunk?
      return "Your shot on #{coord} sank the #{cell.ship.name}!"
    elsif !cell.empty?
      return "Your shot on #{coord} was a hit!"
    end
  end
end
