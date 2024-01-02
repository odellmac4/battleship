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
    end
end