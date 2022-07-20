require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/computer'
require './lib/player'

class Game
  def initialize
    @start = 'p'

    while @start == 'p'
      puts 'Welcome to BATTLESHIP'
      puts 'Enter p to play. Enter q to quit.'
      @start = gets.chomp
      if @start == 'p'
        puts "Enter c for Custom Board. Enter any other button for Standard Board. "
        option = gets.chomp
        if option == 'c'
          puts "How many collumns?"
          col = gets.chomp
          puts "How many rows"
          row = gets.chomp

          @comp = Computer.new(col, row)
          @player = Player.new(col, row)
        else
          @comp = Computer.new
          @player = Player.new
        end
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
    @player.place_ships
    start_turn
  end

  # def player_setup
  #   puts @player_board.render
  #   puts "Enter the squares for the Cruiser (3 spaces):"
  #   coord = gets.chomp.split
  #   while !@player.board.valid_placement?(ship1, coord)
  #     puts "Those are invalid coordinates. Please try again:"
  #     coord = gets.chomp.split
  #   end
  #   @player_board.place(ship1, coord)
  #   puts @player_board.render(true)
  #
  #   puts "Enter the squares for the Submarine (2 spaces):"
  #   coord = gets.chomp.split
  #   while !@player_board.valid_placement?(ship2, coord)
  #     puts "Those are invalid coordinates. Please try again:"
  #     coord = gets.chomp.split
  #   end
  #   @player_board.place(ship2, coord)
  #   puts @player_board.render(true)
  #
  #   start_turn
  # end

  def start_turn
    puts "=============COMPUTER BOARD============="
    puts @comp.board.render
    puts "==============PLAYER BOARD=============="
    puts @player.board.render(true)

    puts "Enter the coordinate for your shot:"
    input = gets.chomp
    while !@player.board.valid_coordinate?(input)
      puts "Please enter a valid coordinate:"
      input = gets.chomp
    end

    puts @comp.fire_shot(input)


    puts @player.fire_random_shot

    if @comp.ships.all? {|ship| ship.sunk?}
      puts "You won!"
    elsif @player.ships.all? {|ship| ship.sunk?}
      puts "I won!"
    else
      start_turn
    end
  end
end
