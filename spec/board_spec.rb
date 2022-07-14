# require 'rspec'
require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Board do
  before :each do
    @board = Board.new()
  end

  it 'class should exist' do
    expect(@board).to be_an_instance_of(Board)
  end

  it 'the cells should be link back to the Cell class'do
    expect(@board.cells['A1']).to be_an_instance_of Cell
  end #cells are coordinates on the board

  it 'should inform if a coordinate is on the board' do
    expect(board.valid_coordinate?('A1')).to eq(true)
    expect(board.valid_coordinate?('D4')).to eq(true)
    expect(board.valid_coordinate?('A5')).to eq(false)
    expect(board.valid_coordinate?('E1')).to eq(false)
    expect(board.valid_coordinate?('A22')).to eq(false)
    expect(board.valid_coordinate?('a1')).to eq(false)
  end

  xit 'should inform if a placement for a ship on the board is valid or not' do
  #check if boat & size completely fits within board
    cruiser = Ship.new("Cruiser", 3)
    cruiser_place = ["A1", "A2", "A3"]

    submarine = Ship.new("Submrine", 2)
    submarine_place = ["B1", "C1"]

    expect(@board.valid_placement(cruiser, cruiser_place)).to eq(true)
    expect(@board.valid_placement(submarine, submarine_place)).to eq(true)

  end


end


# it '' do
  # expect().to eq()
# end
