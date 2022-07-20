require './lib/board'
require './lib/ship'
require './lib/cell'

class Player
  attr_reader :board, :ships
  def initialize
    @board = Board.new
    @ship1 = Ship.new("Cruiser", 3)
    @ship2 = Ship.new("Submarine", 2)
    @ships = [@ship1, @ship2]
  end

  def place_ships

  end

  def place_ships
    puts @board.render

    puts "Enter the squares for the Cruiser (3 spaces):"
    coord = gets.chomp.split
    while !@board.valid_placement?(@ship1, coord)
      puts "Those are invalid coordinates. Please try again:"
      coord = gets.chomp.split
    end
    @board.place(@ship1, coord)
    puts @board.render(true)

    puts "Enter the squares for the Submarine (2 spaces):"
    coord = gets.chomp.split
    while !@board.valid_placement?(@ship2, coord)
      puts "Those are invalid coordinates. Please try again:"
      coord = gets.chomp.split
    end
    @board.place(@ship2, coord)
    puts @board.render(true)
  end

  def fire_shot(coord)
    cell = @board.cells[coord]
    if cell.fired_upon?
      puts "You have already shot on #{coord}. Please pay attention."
    elsif cell.empty?
      puts "Your shot on #{coord} was a miss."
    elsif cell.ship.health == 1
      puts "Your shot on #{coord} sank the #{cell.ship.name}!"
    elsif !cell.empty?
      puts "Your shot on #{coord} was a hit!"
    end
    cell.fire_upon
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
      if cell.empty?
        puts "My shot on #{random_coord} was a miss."
      elsif cell.ship.health == 1
        puts "My shot on #{random_coord} sank the #{cell.ship.name}!"
      elsif !cell.empty?
        puts "My shot on #{random_coord} was a hit!"
      end
      cell.fire_upon
    end
  end



end
