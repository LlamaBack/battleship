
class Board
  attr_reader :cell, :columns_rows
  def initialize(cell)
    @cell = cell
    @columns_rows = 4
  end


  def size
    16
  end



end