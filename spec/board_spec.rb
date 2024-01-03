require './lib/board'
require './lib/cell'
require 'pry'

RSpec.describe Board do
    before(:each) do
        @board = Board.new
    end
    describe 'board' do
      it 'is a board' do
        expect(@board).to be_an_instance_of (Board)
      end
  
      xit 'has cells' do
        expect(@board.cells).to eq ({
            @cell.coordinate => @cell
        })
      end
    end
end