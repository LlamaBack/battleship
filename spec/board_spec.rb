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
    expect(@board.valid_coordinate?('A1')).to eq(true)
    expect(@board.valid_coordinate?('D4')).to eq(true)
    expect(@board.valid_coordinate?('A5')).to eq(false)
    expect(@board.valid_coordinate?('E1')).to eq(false)
    expect(@board.valid_coordinate?('A22')).to eq(false)
    expect(@board.valid_coordinate?('a1')).to eq(false) 
    #false b/c the letter is not capitalized
  end

  it 'should inform if a placement for a ship on the board is valid or not' do
  #check if boat & size completely fits within board
      cruiser = Ship.new('Cruiser', 3)
      submarine = Ship.new('Submarine', 2) 

      board = Board.new()
      cruiser = Ship.new('Cruiser', 3)

      submarine = Ship.new('Submarine', 2) 
     
    
      expect(@board.valid_placement?(cruiser, ['A1','A2', 'A3'])).to eq(true)
      expect(@board.valid_placement?(submarine, ['A2', 'A3', 'A4'])).to eq(false)
    #test if the length of the ship == _placement length
      


      expect(@board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(@board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(@board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(@board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    # coordinates are consecutive: if letters are the same>#should be in sequence
    # coordinates are consecutive: if # are the same>letters should be in sequence

# coordinates can’t be diagonal:
      expect(@board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq false
      expect(@board.valid_placement?(submarine, ["C2", "D3"])).to eq false

      #checks pass then the placement should be valid
      expect(@board.valid_placement?(submarine, ["A1", "A2"])).to eq true
      expect(@board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq true
  end


end


# it '' do
  # expect().to eq()
# end