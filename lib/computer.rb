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

  # def fire_random_shot
  #   keys = @board.cells.keys
  #   random_coord = keys[rand(keys.size)]
  #   cell = @board.cells[random_coord]
  #   # while cell.fired_upon do
  #   #   random_coord = keys[rand(keys.size)]
  #   # end
  #   if cell.fired_upon?
  #     fire_random_shot
  #   else
  #     cell.fire_upon
  #     if cell.empty?
  #       return "Your shot on #{random_coord} was a miss."
  #     elsif cell.ship.sunk?
  #       return "Your shot on #{random_coord} sank the #{cell.ship.name}!"
  #     elsif !cell.empty?
  #       return "Your shot on #{random_coord} was a hit!"
  #     end
  #   end
  # end

  def fire_shot(coord)
    cell = @board.cells[coord]
    if cell.fired_upon?
      return "You have already shot on #{coord}."
    end

    # if cell.ship != nil
    #   puts cell.ship.health
    #         # require "pry"; binding.pry
    # end

    cell.fire_upon
    # require "pry"; binding.pry

    # if cell.ship != nil
    #   puts cell.ship.health
    # end

    if cell.empty?
      return "Your shot on #{coord} was a miss."
    elsif cell.ship.sunk?
      return "Your shot on #{coord} sank the #{cell.ship.name}!"
    elsif !cell.empty?
      return "Your shot on #{coord} was a hit!"
    end

  end
end
