require "./lib/cell"
require "./lib/ship"

class Board
  attr_reader :cells
<<<<<<< HEAD

  def initialize(col = 4, row = 4)
    @cells = {}
    @col = col.to_i
    @row = row.to_i
    @y = "A"
    @row.to_i.times {
      @x = 1
      @col.to_i.times {
        @cells[@y + @x.to_s] = Cell.new(@y + @x.to_s)
        @x += 1
=======
  def initialize(custom = false)
    @cells = 
    {}
    if custom
      puts "How many collumns?"
      @col = gets.chomp
      puts "How many rows?"
      @row = gets.chomp
      @x = "A"
      @col.times {
        @y = 1
        @row.times {
          @cells[@x + @y.to_s] = Cell.new(@x + @y.to_s)
          @y += 1
        }
        @x = @x.next
>>>>>>> 7f131e0d5f2e04ff5b52febd89c9aaa2a980512a
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
      (coord_2.delete("^A-Z") == coord_1.delete("^A-Z").next) ^ (coord_2.delete("^0-9") == coord_1.delete("^0-9").next) end
      return false
    elsif !placements.all? { |cell| @cells[cell].empty? }
      return false
    end
    return true
  end

<<<<<<< HEAD
  def place(boat, dots)#dots represents spaces on
    dots.each do |dot| #process through dots>look at the dot argument
      @cells[dot].place_ship(boat)#place the ship into dot
=======
  def place(ship, cells)#cells represents spaces on
    cells.each do |cell| #process through cells>look at the cell argument
      @cells[cell].place_ship(ship)#place the ship into dot
>>>>>>> 7f131e0d5f2e04ff5b52febd89c9aaa2a980512a
    end
  end

  def place_rand(ship)
    vertical = [true, false].sample
    keys = @cells.keys
    starting_coord = keys[rand(keys.size)]
    placements = [starting_coord]

    (ship.length - 1).times do
      if vertical
        placements << "#{starting_coord.delete("^A-Z").next}#{starting_coord.delete("^0-9")}"
        starting_coord = "#{starting_coord.delete("^A-Z").next}#{starting_coord.delete("^0-9")}"
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
  end
end
