require "./lib/board"

RSpec.describe Board do
  it 'Board class should exist' do
    board = Board.new
    expect(board).to be_an_instance_of(Board)
    expect(board.cells).to be_an_instance_of(Hash)
  end

  it 'Board class checks for valid coordinates' do
    board = Board.new
    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end


end
