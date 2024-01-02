require './lib/ship'
require './lib/cell'
require 'pry'

RSpec.describe Cell do
    before(:each) do
      @cell = Cell.new("B4")
  
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
end