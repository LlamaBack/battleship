# require 'rspec'
require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Board do
  before :each do
    @cells = Board.new("A1")
  end

  it 'class should exist' do
    expect(@cells).to be_an_instance_of(Board)
  end

  it 'it should be 16 cells'do
    expect(@cells.size).to eq(16)
  end

  it 'should have 4 columns and 4 rows'do
    expect(@cells.columns_rows).to eq 4
  end

  xit '' do
    expect().to eq()
  end

  # it '' do
    # expect().to eq()
  # end


end


# it '' do
  # expect().to eq()
# end