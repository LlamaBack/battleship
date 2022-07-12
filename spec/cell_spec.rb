require './lib/cell' #confirm the file name

RSpec.describe Cell do
  it 'Cell class should exist' do
    cell_1 = Cell.new("A1")
    expect(cell_1).to be_an_instance_of(Cell)
  end

end
