require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Board do
  let(:board) { Board.new() }
  let(:cruiser) { Ship.new("Cruiser", 3) } 
  let(:submarine) { Ship.new("Submarine", 2) } 

  it 'should exist as a class' do
    expect(board).to be_an_instance_of(Board)
  end

  it 'cells should be linked to the Cell class'do
    expect(board.cells['A1']).to be_an_instance_of Cell
    expect(board.cells['A2']).to be_an_instance_of Cell
    expect(board.cells['A3']).to be_an_instance_of Cell
  end 

  it 'should inform if a coordinate IS on the board' do
    expect(board.valid_coordinate?('A1')).to eq(true)
    expect(board.valid_coordinate?('D4')).to eq(true)
    expect(board.valid_coordinate?('C2')).to eq(true)
  end
  
  it 'should inform if a coordinate IS NOT on the board' do
    expect(board.valid_coordinate?('A5')).to eq(false)
    expect(board.valid_coordinate?('E1')).to eq(false)
    expect(board.valid_coordinate?('A22')).to eq(false)
    expect(board.valid_coordinate?('a1')).to eq(false)
  end
  
  context 'evaluating the valid placement method' do
    it 'should have a equal length to its coordinates length' do
      expect(cruiser.length).to eq(["A1", "A2", "A3"].length)
      expect(submarine.length).to eq(["B1", "C1"].length)
      expect(submarine.length).to eq(["B1", "C1"].length)
    end
      
    it 'should have consecutive coordinates' do
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A5"])).to eq(false)
      expect(board.valid_placement?(submarine, ["B1", "D1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    end

    it 'should NOT have diagonal coordinates' do
      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["C2", "D3"])).to eq(false)
    end

    it 'should have a valid placements' do
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
      expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
    end
  end  

  it 'board should place a ship in its cells' do
    #multiple Cells will contain the same ship
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    expect(cell_3.ship == cell_2.ship).to eq true
    expect(cell_2.ship == cell_1.ship).to eq true
    expect(cell_1.ship).to eq cruiser
    expect(cell_2.ship).to eq cruiser
    expect(cell_3.ship).to eq cruiser
  end

  it 'should NOT have overlapping ships' do
    board.place(cruiser, ["A1", "A2", "A3"])
    expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
  end

  context 'the board can rendor itself' do
    it 'should be a grid' do
      expect(board.render).to eq(
        "  1 2 3 4 \n" +
        "A . . . . \n" +
        "B . . . . \n" +
        "C . . . . \n" +
        "D . . . . \n"
      )
    end

    it 'should reveal the ships locations and if we ask'do
      board.place(cruiser, ["A1", "A2", "A3"])
      expect(board.render(true)).to eq(
        "  1 2 3 4 \n" +
        "A S S S . \n" +
        "B . . . . \n" +
        "C . . . . \n" +
        "D . . . . \n"
      )
    end

    it 'should be any size board the user wants' do
      custom_board = Board.new(5, 5)
      expect(custom_board.render).to eq(
      "  1 2 3 4 5 \n" +
      "A . . . . . \n" +
      "B . . . . . \n" +
      "C . . . . . \n" +
      "D . . . . . \n" +
      "E . . . . . \n"
      )
    end

    it 'should display the cells status on grid when NOT revealed' do
      board.place(cruiser, ["A1", "A2", "A3"])
      board.place(submarine, ["C3", "D3"])
      cell_1 = board.cells["A1"]
      cell_1.fire_upon
      cell_22 = board.cells["B3"]
      cell_22.fire_upon
      cell_42 = board.cells["D3"]
      cell_42.fire_upon
      cell_32 = board.cells["C3"]
      cell_32.fire_upon
      
      expect(board.render).to eq(
      "  1 2 3 4 \n" +
      "A H . . . \n" +
      "B . . M . \n" +
      "C . . X . \n" +
      "D . . X . \n")
    end

    it 'should display the cells status in the grid when revealed' do
      board.place(cruiser, ["A1", "A2", "A3"])
      board.place(submarine, ["C3", "D3"])
      cell_12 = board.cells["A3"]
      cell_12.fire_upon
      cell_22 = board.cells["B3"]
      cell_22.fire_upon

      expect(board.render(true)).to eq(
      "  1 2 3 4 \n" +
      "A S S H . \n" +
      "B . . M . \n" +
      "C . . S . \n" +
      "D . . S . \n")
    end
  end
end
