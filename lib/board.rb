require "./lib/cell"
require "./lib/ship"

class Board
  attr_reader :cells

  def initialize(col = 4, row = 4)
    @cells = {}
    # if custom
    @col = col.to_i
    @row = row.to_i
    @y = "A"
    @row.to_i.times {
      @x = 1
      @col.to_i.times {
        @cells[@y + @x.to_s] = Cell.new(@y + @x.to_s)
        @x += 1
      }
      @y = @y.next
    }
  end

  def valid_coordinate?(place_on_board)
    @cells.has_key?(place_on_board)
  end

  def valid_placement?(ship, placements)
    if ship.length != placements.length
      return false
    elsif placements.any? {|coord| !@cells.key?(coord)}
      return false
    elsif !placements.each_cons(2).all? do |coord_1, coord_2|
      (coord_2[0] == coord_1[0].next) ^ (coord_2[1] == coord_1[1].next) end
      return false
    elsif !placements.all? { |dot| @cells[dot].empty? }
      return false
    end
    return true
  end

  def place(boat, dots)#dots represents spaces on


    dots.each do |dot| #process through dots>look at the dot argument
      @cells[dot].place_ship(boat)#place the ship into dot
    end


  end

  def place_rand(ship)
    vertical = [true, false].sample
    keys = @cells.keys
    starting_coord = keys[rand(keys.size)]
    placements = [starting_coord]

    (ship.length - 1).times do
      if vertical
        placements << "#{starting_coord[0].next}#{starting_coord[1]}"
        starting_coord = "#{starting_coord[0].next}#{starting_coord[1]}"
      elsif !vertical
        placements << starting_coord.next
        starting_coord = starting_coord.next
      end
    end

    if !valid_placement?(ship, placements)
      place_rand(ship)
    else
      place(ship,placements)
    end

  end

  def render(actual = false)
    rend = "  "
    collumn = 0
    @col.times {rend += "#{collumn += 1} "}
    rend += "\n"

    @y = "A"
    @row.to_i.times {
      @x = 1
      rend += "#{@y} "
      @col.to_i.times {
        rend += "#{@cells[@y + @x.to_s].render(actual)} "
        @x += 1
      }
      rend += " \n"
      @y = @y.next
    }
    rend
    #
    # rend = "  1 2 3 4 \n" +
    # "A #{@cells["A1"].render(actual)} #{@cells["A2"].render(actual)} #{@cells["A3"].render(actual)} #{@cells["A4"].render(actual)} \n" +
    # "B #{@cells["B1"].render(actual)} #{@cells["B2"].render(actual)} #{@cells["B3"].render(actual)} #{@cells["B4"].render(actual)} \n" +
    # "C #{@cells["C1"].render(actual)} #{@cells["C2"].render(actual)} #{@cells["C3"].render(actual)} #{@cells["C4"].render(actual)} \n" +
    # "D #{@cells["D1"].render(actual)} #{@cells["D2"].render(actual)} #{@cells["D3"].render(actual)} #{@cells["D4"].render(actual)} \n"
  end
end
