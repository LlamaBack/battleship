require './lib/game'

RSpec.describe Game do
  it 'Game exists' do
    game = Game.new
    expect(game).to be_an_instance_of(Game)
  end

  it 'Game has a welcome message' do
    game = Game.new
    # expect(game).to output('Welcome to BATTLESHIP').to_stdout
    # expect(game).to output('Enter p to play. Enter q to quit.').to_stdout
  end
end
