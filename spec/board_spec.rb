# require 'rspec'
require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Board do
  before :each do
    @cell_id = Board.new()
  end

  it 'class should exist' do
    expect(@cell_id).to be_an_instance_of(Board)
  end

  it 'the cells should be link back to the Cell class'do
    expect(@cell_id.cells['A1']).to be_an_instance_of Cell
  end #cells are coordinates on the board

  it 'should inform if a coordinate is on the board' do
      board_cell = Board.new()
    expect(board_cell.valid_coordinate?('A1')).to eq(true)
      board_cell = Board.new()
    expect(board_cell.valid_coordinate?('D4')).to eq(true)
      board_cell = Board.new()
    expect(board_cell.valid_coordinate?('A5')).to eq(false)
      board_cell = Board.new()
    expect(board_cell.valid_coordinate?('E1')).to eq(false)
      board_cell = Board.new()
    expect(board_cell.valid_coordinate?('A22')).to eq(false)
      board_cell = Board.new()#false b/c the letter is not capitalized
    expect(board_cell.valid_coordinate?('a1')).to eq(false) 
  end

  # it 'should inform if a placement for a ship on the board is valid or not' do
  # #check if boat & size completely fits within board
  #     cruiser = Ship.new("Cruiser", 3)
  #     submarine = Ship.new("Submarine", 2) 

  #   board_cell = Board.new('E1')
  
  #   expect().to eq()
  # end


end


# it '' do
  # expect().to eq()
# end