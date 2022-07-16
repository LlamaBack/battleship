require "./lib/cell"
require "./lib/ship"

class Board
  attr_reader :cells, :place
  def initialize()#we did not need cells in the () as we dont actually use it
    @cells = {
      "A1"=>Cell.new("A1"),"A2"=>Cell.new("A2"),"A3"=>Cell.new("A3"),"A4"=>Cell.new("A4"),
      "B1"=>Cell.new("B1"),"B2"=>Cell.new("B2"),"B3"=>Cell.new("B3"),"B4"=>Cell.new("B4"),
      "C1"=>Cell.new("C1"),"C2"=>Cell.new("C2"),"C3"=>Cell.new("C3"),"C4"=>Cell.new("C4"),
      "D1"=>Cell.new("D1"),"D2"=>Cell.new("D2"),"D3"=>Cell.new("D3"),"D4"=>Cell.new("D4"),
    }
  end

  def valid_coordinate?(place_on_board)
      if @cells.has_key?(place_on_board)
        true
      else
        false
      end
  end
  
  def valid_placement?(ship, placements)
    if ship.length != placements.length
      return false
    
    elsif !placements.each_cons(2).all? do |coord_1, coord_2|
      (coord_2[0] == coord_1[0].next) ^ (coord_2[1] == coord_1[1].next) end
      return false

    elsif !placements.all?   { |dot| @cells[dot].empty? }  
          return false
    end
    return true
  end

  def place(boat, dots)#dots represents spaces on board
      dots.each do |dot| #process through dots>look at the dot argument
        @cells[dot].place_ship(boat)#place the ship into dot 
              end
  end

  def render(option = false)
  
    rend_1 =  "  1 2 3 4 \n"+
    "A #{@cells["A1"].render(option)} #{@cells["A2"].render(option)} #{@cells["A3"].render(option)} #{@cells["A4"].render(option)} \n"+
    "B #{@cells["B1"].render(option)} #{@cells["B2"].render(option)} #{@cells["B3"].render(option)} #{@cells["B4"].render(option)} \n"+
    "C #{@cells["C1"].render(option)} #{@cells["C2"].render(option)} #{@cells["C3"].render(option)} #{@cells["C4"].render(option)} \n"+
    "D #{@cells["D1"].render(option)} #{@cells["D2"].render(option)} #{@cells["D3"].render(option)} #{@cells["D4"].render(option)} \n"
    # require "pry";binding.pry
    

  end

end
