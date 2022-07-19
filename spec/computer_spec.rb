require './lib/computer'

Rspec.describe Computer do
  it 'Computer should exist' do
    comp = Computer.new
    expect(comp).to be_an_instance_of(Computer)
  end
end
