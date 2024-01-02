require './lib/ship'
require './lib/cell'
require 'pry'

RSpec.describe Cell do
    before(:each) do
      @cell = Cell.new("B4")
    #   @cruiser = Ship.new("Cruiser", 3)
  
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
        xit 'places a ship on the cell' do
            @cell.place_ship(@cruiser)

            expect(@cell.ship).to eq (@cruiser)
        end
    end

    describe '#fired_upon and can change ship health' do
        it 'is not fired upon by default' do
            expect(@cell.fired_upon?).to eq (false)
        end

        xit 'can be fired upon' do
            @cell.fire_upon

            expect(@cell.ship.health).to eq (2)
            expect(@cell.fired_upon?).to eq (true)
        end
    end
end