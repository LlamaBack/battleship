require './lib/computer'

RSpec.describe Computer do
  let(:comp) { Computer.new }

  it 'should exist as a class' do
    expect(comp).to be_an_instance_of(Computer)
  end
end
