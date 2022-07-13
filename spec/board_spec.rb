require "./lib/board"

RSpec.describe Board do
  it 'Board class should exist' do
    board = Board.new
    expect(board).to be_an_instance_of(Board)
    expect(board.cells).to be_an_instance_of(Hash)
  end

  
end
