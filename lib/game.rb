require './lib/board'
require './lib/ship'
require './lib/cell'

class Game
  def initialize
    @start = 'p'

    while @start == 'p'
      puts 'Welcome to BATTLESHIP'
      puts 'Enter p to play. Enter q to quit.'
      @start = gets.chomp
      if @start == 'p'
        @comp = Computer.new
        @player_board = Board.new
        game_start
      elsif @start == 'q'
        puts 'Goodbye.'
        break
      else
        puts "ERROR:Incorrect Input. Please try again."
        @start = 'p'
      end
    end

  end

  def game_start


    puts 'I have laid out my ships on the grid.'
    puts 'You now need to lay out your two ships.'
    puts 'The Cruiser is three units long and the Submarine is two units long.'
    player_setup
  end

  def player_setup
    ship1 = Ship.new("Cruiser", 3)
    ship2 = Ship.new("Submarine", 2)
    puts @player_board.render
    puts "Enter the squares for the Cruiser (3 spaces):"
    coord = gets.chomp.split
    while !@player_board.valid_placement?(ship1, coord)
      puts "Those are invalid coordinates. Please try again:"
      coord = gets.chomp.split
    end
    @player_board.place(ship1, coord)
    puts @player_board.render(true)

    puts "Enter the squares for the Submarine (2 spaces):"
    coord = gets.chomp.split
    while !@player_board.valid_placement?(ship2, coord)
      puts "Those are invalid coordinates. Please try again:"
      coord = gets.chomp.split
    end
    @player_board.place(ship2, coord)
    puts @player_board.render(true)

    start_turn
  end

  def start_turn
    puts "=============COMPUTER BOARD============="
    puts @comp_board.render
    puts "==============PLAYER BOARD=============="
    puts @player_board.render(true)

    puts "Enter the coordinate for your shot:"
    input = gets.chomp
    while !@player_board.valid_coordinate(input)
      puts "Please enter a valid coordinate:"
      input = gets.chomp
    end
    while @player_board.cells[input].fire_upon
    end

    comp_shot


  end
end
