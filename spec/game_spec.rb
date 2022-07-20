require './lib/game'

RSpec.describe Game do
  let(:game) { Game.new }

  it 'should exist as a class' do
    expect(game).to be_an_instance_of Game
  end

  end
