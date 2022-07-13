require './lib/cell' #confirm the file name

RSpec.describe Cell do
  it 'Cell class should exist' do
    cell_1 = Cell.new("A1")
    expect(cell_1).to be_an_instance_of(Cell)
    expect(cell_1.empty?).to eq(true)
  end

  it 'Cell can place ship' do
    ship_1 = Ship.new("Cruiser", 3)
    cell_1 = Cell.new("A1")
    cell_1.place_ship(ship_1)

    expect(cell_1.ship).to eq(ship_1)
    expect(cell_1.empty?).to eq(false)
  end

  it 'Cell can be fired upon' do
    ship_1 = Ship.new("Cruiser", 3)
    cell_1 = Cell.new("A1")
    expect(cell_1.fired_upon?).to eq(false)
    cell_1.place_ship(ship_1)

    cell_1.fire_upon
    expect(cell_1.ship.health).to eq(2)
    expect(cell_1.fired_upon?).to eq(true)
  end

  it 'Cell can render' do
    cell_1 = Cell.new("A1")
    cell_2 = Cell.new("A2")
    cell_3 = Cell.new("A3")
    cell_4 = Cell.new("A4")
    cell_5 = Cell.new("A5")

    ship_1 = Ship.new("Cruiser", 3)

    expect(cell_1.render).to eq(".")

    cell_2.fire_upon
    expect(cell_2.render).to eq("M")

    cell_3.place_ship(ship_1)
    cell_4.place_ship(ship_1)
    cell_5.place_ship(ship_1)

    expect(cell_3.render(true)).to eq("S")
    cell_3.fire_upon

    cell_4.fire_upon
    expect(cell_4.render).to eq("H")

    cell_5.fire_upon
    expect(cell_5.render).to eq("X")
  end


end
