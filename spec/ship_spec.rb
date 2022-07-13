require './lib/ship'

RSpec.describe Ship do
  before :each do
    @boat_1 = Ship.new('Cruiser', 3)
    @boat_2 = Ship.new('Submarine', 2)
  end

  it 'Ship class should exist'do
    expect(@boat_1).to be_an_instance_of(Ship)
  end

  it '@boats should have unique names'do
    expect(@boat_1.name).to eq('Cruiser')
    expect(@boat_2.name).to eq('Submarine')
  end

  it '@boats should have a unique lenghts'do
    expect(@boat_1.length).to eq(3)
    expect(@boat_2.length).to eq(2)
  end

  it'should inform boat health'do
    expect(@boat_1.health).to eq(3)
    expect(@boat_2.health).to eq(2)
  end

  it'should inform if boat is hit'do
      @boat_1.hit
    expect(@boat_1.health).to eq(2)
      @boat_2.hit
    expect(@boat_2.health).to eq(1)
  end

  it'should inform if boat is sunk'do
    expect(@boat_1.sunk?).to eq(false)
    expect(@boat_2.sunk?).to eq(false)
      @boat_1.hit
      @boat_1.hit
      @boat_1.hit
    expect(@boat_1.sunk?).to eq(true)
  end

  context 'Ship basic characteristics'do
    it'Ship class should exist'do
      expect(@boat_1).to be_an_instance_of (Ship)
    end

    it'@boats should have unique names'do
      expect(@boat_1.name).to eq('Cruiser')
      expect(@boat_2.name).to eq('Submarine')
    end

    it'@boats should have a unique lenghts'do
      expect(@boat_1.length).to eq(3)
      expect(@boat_2.length).to eq(2)
    end
  end

  context 'check the status of the boats within the game'do
    it'should inform boat health'do
      expect(@boat_1.health).to eq(3)
      expect(@boat_2.health).to eq(2)
    end

    it'should inform if boat is hit'do
        @boat_1.hit
      expect(@boat_1.health).to eq(2)
        @boat_2.hit
      expect(@boat_2.health).to eq(1)
    end

    it'should inform if boat is sunk'do
      expect(@boat_1.sunk?).to eq(false)
      expect(@boat_2.sunk?).to eq(false)
        @boat_1.hit
        @boat_1.hit
        @boat_1.hit
      expect(@boat_1.sunk?).to eq(true)
    end
  end

end
