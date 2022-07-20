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
        puts "Enter c for Custom Board. Enter any other button for Standard Board."
        option = gets.chomp
        if option == 'c'
          puts "How many columns?"
          col = gets.chomp.to_i
          puts "How many rows"
          row = gets.chomp.to_i

          @ships = []
          puts "How many ships?"
          num_ships = gets.chomp.to_i
          ship_num = 0
          num_ships.times do
            puts "What is the name of ship #{ship_num += 1}?"
            name = gets.chomp
            puts "What is the length of that ship?"
            length = gets.chomp.to_i
            @ships << Ship.new(name, length)
          end
          @comp = Computer.new(col, row, @ships)
          @player = Player.new(col, row, @ships)
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
    puts "You now need to lay out your #{@player.ships.length} ships."

    @player.place_ships
    start_turn
  end

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
      # require "pry";binding.pry
      start_turn
    end
  end
end
