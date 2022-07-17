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
    puts 'I have laid out my ships on the grid.'

    puts 'GAME HAS ENDED'
  end

  def comp_setup
    @comp_board
  end
end
