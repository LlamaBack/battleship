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
  end

  it 'should inform if a placement for a ship on the board is valid or not' do
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    #ship length equals coordinates length
    expect(cruiser.length).to eq(["A1", "A2", "A3"].length)
    expect(submarine.length).to eq(["B1", "C1"].length)

    #coordinates are consecutive
    expect(@board.valid_placement?(cruiser, ["A1", "A2", "A5"])).to eq(false)
    expect(@board.valid_placement?(submarine, ["B1", "D1"])).to eq(false)
    expect(@board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(@board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)

    #coordinates are not diagonal
    expect(@board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(@board.valid_placement?(cruiser, ["C2", "D3"])).to eq(false)

    #valid placements
    expect(@board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
    expect(@board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
  end


  it 'the board should be able to place a ship in its cells' do
    #multiple Cells will contain the same ship
    cruiser = Ship.new("Cruiser", 3)
    @board.place(cruiser, ["A1", "A2", "A3"])

    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]

    expect(cell_3.ship == cell_2.ship).to eq true
    expect(cell_2.ship == cell_1.ship).to eq true
    expect(cell_1.ship).to eq cruiser
    expect(cell_2.ship).to eq cruiser
    expect(cell_3.ship).to eq cruiser
  end

  it 'valid placements checks if a ship would overlap with another' do
    cruiser = Ship.new("Cruiser", 3)
    @board.place(cruiser, ["A1", "A2", "A3"])
    # require 'pry';binding.pry

    submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
  end

  it 'render prints out the whole board' do
    cruiser = Ship.new("Cruiser", 3)
    @board.place(cruiser, ["A1", "A2", "A3"])
    expect(@board.render).to eq(
      "  1 2 3 4 \n" +
      "A . . . . \n" +
      "B . . . . \n" +
      "C . . . . \n" +
      "D . . . . \n"
    )
    expect(@board.render(true)).to eq(
      "  1 2 3 4 \n" +
      "A S S S . \n" +
      "B . . . . \n" +
      "C . . . . \n" +
      "D . . . . \n"
    )
  end

  it 'renders any size board' do
    custom_board = Board.new(true)
    expect(@board.render).to eq(
      "  1 2 3 4 5 \n" +
      "A . . . . . \n" +
      "B . . . . . \n" +
      "C . . . . . \n" +
      "D . . . . . \n" +
      "E . . . . . \n"
    )
  end

it 'should display the cells status in a formatted grid. ' do
  cruiser = Ship.new("Cruiser", 3)
  @board.place(cruiser, ["A1", "A2", "A3"])
  # require 'pry';binding.pry

  expect(@board.render).to eq(
  "  1 2 3 4 \n" +
  "A . . . . \n" +
  "B . . . . \n" +
  "C . . . . \n" +
  "D . . . . \n")
  @board.place(cruiser, ["A1", "A2", "A3"])
  # require 'pry';binding.pry
  expect(@board.render(true)).to eq(
  "  1 2 3 4 \n" +
  "A S S S . \n" +
  "B . . . . \n" +
  "C . . . . \n" +
  "D . . . . \n")
# require 'pry';binding.pry
end



end
