require './lib/ship'
class Cell
  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @struck = false
  end

  def place_ship(ship)
    @ship = ship
  end

  def empty?
    @ship == nil
  end

  def fired_upon?
    @struck
  end

  def fire_upon
    if @ship != nil
      @ship.hit
    end
    @struck = true
  end

  def render(option = false)
    if !fired_upon? && option && !empty?
      "S"
    elsif !fired_upon?
      "."
    elsif fired_upon? && empty?
      "M"
    elsif fired_upon? && @ship.sunk?
      "X"
    elsif fired_upon? && !empty?
      "H"
    end
  end
end
