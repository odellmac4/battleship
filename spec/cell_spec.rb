require './lib/ship'
require './lib/cell'
require 'pry'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new("B4")
    @cell_2 = Cell.new("C3")
    @cruiser = Ship.new("Cruiser", 3)

  end
  describe 'initialize cell' do
    it 'is a cell' do
      expect(@cell).to be_an_instance_of (Cell)
    end

    it 'has a coordinate' do
      expect(@cell.coordinate).to eq ("B4")
    end

    it 'defaults to having no ship' do
      expect(@cell.ship).to eq (nil)
    end

    it 'defaults to being empty' do
      expect(@cell.empty?).to eq (true)
    end
  end

  describe '#place_ship' do
    it 'places a ship on the cell' do
      @cell.place_ship(@cruiser)

      expect(@cell.ship).to eq (@cruiser)
    end
  end

  describe '#fired_upon and can change ship health' do
    it 'is not fired upon by default' do
      expect(@cell.fired_upon?).to eq (false)
    end

    it 'can be fired upon' do
      @cell.place_ship(@cruiser)
      @cell.fire_upon

      expect(@cell.ship.health).to eq (2)
      expect(@cell.fired_upon?).to eq (true)
      expect(@cell.empty?).to eq (false)
    end
  end

  describe '#render' do
    it 'returns a String if cell is not fired upon or fired upon and no ship' do
      expect(@cell.render).to eq (".")
      
      @cell.fire_upon
      expect(@cell.render).to eq ("M")

      @cell.place_ship(@cruiser)
      @cell.fire_upon
      expect(@cell.render).to eq ("H")

      expect(@cruiser.sunk?).to eq (false)
      @cell.fire_upon
      @cell.fire_upon
      expect(@cruiser.sunk?).to eq (true)
      expect(@cell.render).to eq ("X")
    end

    it 'reveal a ship in the cell even if it has not been fired upon' do
      @cell_2.place_ship(@cruiser)
      expect(@cell_2.render).to eq (".")
      expect(@cell_2.render(true)).to eq ("S")

      @cell_2.fire_upon
      @cell_2.fire_upon
      @cell_2.fire_upon
      
      expect(@cruiser.sunk?).to eq (true)
      expect(@cell_2.render).to eq ("X")

    end
  end

  describe 'create multiple cells' do
    it 'can  multiply' do
      cells = [
        {coordinate: "A1"},
        {coordinate: "A2"},
        {coordinate: "A3"}
      ]
      
      created_cells = Cell.create_multiple_cells(cells)
      expect(created_cells).to be_a Array
      expect(created_cells.length).to eq (3)
    end
  end
end