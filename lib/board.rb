require './lib/cell'
require './lib/ship'

class Board
  attr_reader :cells
  def initialize()#we did not need cells in the () as we dont actually use it 
    @cells = {
      'A1'=>Cell.new('A1'),'A2'=>Cell.new('A2'),'A3'=>Cell.new('A3'),'A4'=>Cell.new('A4'),
      'B1'=>Cell.new('B1'),'B2'=>Cell.new('B2'),'B3'=>Cell.new('B3'),'B4'=>Cell.new('B4'),
      'C1'=>Cell.new('C1'),'C2'=>Cell.new('C2'),'C3'=>Cell.new('C3'),'C4'=>Cell.new('C4'),
      'D1'=>Cell.new('D1'),'D2'=>Cell.new('D2'),'D3'=>Cell.new('D3'),'D4'=>Cell.new('D4'),
    }
  end

  def valid_coordinate?(place_on_board)
      if @cells.has_key?(place_on_board)
        true
      else
        false
      end
  end
     

  def valid_placement?(ship, boat_placement)
    if ship.length != boat_placement.length 
      return false
    elsif 
      !boat_placement.each_cons(2).all? do 
        |cord_1, cord_2| ((cord_2[0] == cord_1[0].next) ^ (cord_2[1] == cord_1[1].next))end
        return false
      end
  #for the placement array>check 2 elements across for consq. numbs for full array
#|coordinate one, coordinate two| ((cord2[index position 0])) compared it to cord1's index position 0
      #breaking down arayu into index position 
    return true
  end

end


