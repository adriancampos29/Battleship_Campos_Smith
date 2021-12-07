require './lib/ship'

RSpec.describe Ship do
  it 'has attributes' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.name).to eq("Cruiser")
    expect(cruiser.length).to eq(3)
    expect(cruiser.health).to eq(3)
  end

  it 'it can or cant be sunk' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.sunk?).to eq(false)
  end

  it 'can be hit' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    expect(cruiser.health).to eq(2)
  end


end
