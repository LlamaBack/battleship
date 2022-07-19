require './lib/game'

RSpec.describe Game do
  before :each do
    @game = Game.new
  end
  
  
  it 'Game exists' do
    expect(@game).to be_an_instance_of Game
  end

  it 'Game has a welcome message' do
    # expect(@game.welcome).to eq('Welcome to BATTLESHIP')
    expect(@game.messages).to eq(
    "Welcome to BATTLESHIP \n" + 
    "Enter p to play. Enter q to quit.")
    require 'pry';binding.pry
    end

    # it '' do
    #   expect 
    # end


end
