require './lib/ship'
class Cell
  attr_reader :coordinate
  def initialize(coordinate)
    @coordinate = coordinate
    @ship
  end

  def place_ship(ship)
    @ship = ship
  end
end
