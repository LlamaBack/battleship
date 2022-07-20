require "./lib/cell"
require "./lib/ship"

class Board
  attr_reader :cells
  def initialize(custom = false)#we did not need cells in the () as we dont actually use it
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
      }
    else
      @cells = {
        'A1'=>Cell.new('A1'),'A2'=>Cell.new('A2'),'A3'=>Cell.new('A3'),'A4'=>Cell.new('A4'),
        'B1'=>Cell.new('B1'),'B2'=>Cell.new('B2'),'B3'=>Cell.new('B3'),'B4'=>Cell.new('B4'),
        'C1'=>Cell.new('C1'),'C2'=>Cell.new('C2'),'C3'=>Cell.new('C3'),'C4'=>Cell.new('C4'),
        'D1'=>Cell.new('D1'),'D2'=>Cell.new('D2'),'D3'=>Cell.new('D3'),'D4'=>Cell.new('D4')
      }
    end
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
    elsif !placements.all? { |cell| @cells[cell].empty? }
      return false
    end
    return true
  end

  def place(ship, cells)#dots represents spaces on
    cells.each do |cell| #process through dots>look at the dot argument
      @cells[cell].place_ship(ship)#place the ship into dot
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
    rend = "  1 2 3 4 \n" +
    "A #{@cells["A1"].render(actual)} #{@cells["A2"].render(actual)} #{@cells["A3"].render(actual)} #{@cells["A4"].render(actual)} \n" +
    "B #{@cells["B1"].render(actual)} #{@cells["B2"].render(actual)} #{@cells["B3"].render(actual)} #{@cells["B4"].render(actual)} \n" +
    "C #{@cells["C1"].render(actual)} #{@cells["C2"].render(actual)} #{@cells["C3"].render(actual)} #{@cells["C4"].render(actual)} \n" +
    "D #{@cells["D1"].render(actual)} #{@cells["D2"].render(actual)} #{@cells["D3"].render(actual)} #{@cells["D4"].render(actual)} \n"
  end
end
