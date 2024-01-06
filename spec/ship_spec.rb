require './lib/ship'

RSpec.describe Ship do
  it 'exists' do
    cruiser = Ship.new('Cruiser', 3)
    expect(cruiser).to be_an_instance_of(Ship)
  end

  describe 'has attributes' do
    it 'has name and length' do
      cruiser = Ship.new('Cruiser', 3)

      expect(cruiser.name).to eq('Cruiser')
      expect(cruiser.length).to eq(3)
    end

    it 'has health' do
      cruiser = Ship.new('Cruiser', 3)
      expect(cruiser.health).to eq(3)
    end
  end

  it 'can tell if a ship has been sunk' do
    cruiser = Ship.new('Cruiser', 3)
    expect(cruiser.sunk?).to eq(false)

    cruiser.hit
    expect(cruiser.health).to eq(2)

    cruiser.hit
    expect(cruiser.health).to eq(1)
    expect(cruiser.sunk?).to eq(false)

    cruiser.hit
    expect(cruiser.sunk?).to eq(true)
  end
end