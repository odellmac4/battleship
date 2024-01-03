require './lib/board'
require './lib/cell'
require 'pry'

RSpec.describe Board do
    before(:each) do
        @board = Board.new
        @cell = Cell.new("B4")
    end
    describe 'board' do
      it 'is a board' do
        expect(@board).to be_an_instance_of (Board)
      end
  
      it 'has cells' do
        board_of_cells = @board.cells
        expect(board_of_cells).to be_an_instance_of (Hash)

        board_of_cells.each do |key , value|
            expect(value.class).to be (Cell)
            expect(key.class).to be (String)
        end

        expect(board_of_cells.count).to eq (16)
      end
    end
end