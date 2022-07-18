require './lib/board'
require './lib/ship'
require './lib/cell'

class Game
  def initialize
    @start = 'p'
    @comp_board = Board.new
    @player_board = Board.new
    while @start == 'p'
      puts 'Welcome to BATTLESHIP'
      puts 'Enter p to play. Enter q to quit.'
      @start = gets.chomp
      if @start == 'p'
        gamestart
      elsif @start == 'q'
        puts 'Goodbye.'
        break
      else
        puts "ERROR:Incorrect Input. Please try again."
        @start = 'p'
      end
    end

  end

  def gamestart
    ship1 = Ship.new("Cruiser", 3)
    ship2 = Ship.new("Submarine", 2)
    @comp_board.place_rand(ship1)
    @comp_board.place_rand(ship2)
    puts 'I have laid out my ships on the grid.'
    puts 'You now need to lay out your two ships.'
    puts 'The Cruiser is three units long and the Submarine is two units long.'
    player_setup
  end

  def player_setup
    ship1 = Ship.new("Cruiser", 3)
    ship2 = Ship.new("Submarine", 2)
    @player_board.render
    puts "Enter the squares for the Cruiser (3 spaces):"
    @hello = gets.chomp.split
        require 'pry'; pry.binding

    @player_board.place(ship1, gets.chomp.split)

  end
end
