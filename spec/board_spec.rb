require './lib/board'
require './lib/cell'
require 'pry'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    @cell = Cell.new("B4")
    @cell_2 = Cell.new("C3")
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  describe 'board' do
    it 'is a board' do
      expect(@board).to be_an_instance_of(Board)
    end

    it 'has cells' do
      board_of_cells = @board.cells
      expect(board_of_cells).to be_an_instance_of(Hash)

      board_of_cells.each do |key, value|
        expect(value.class).to be(Cell)
        expect(key.class).to be(String)
      end

      expect(board_of_cells.count).to eq(16)
    end
  end

  describe 'validate' do
    it 'can validate a cell' do
      cells = [
        { coordinate: 'A1' },
        { coordinate: 'A2' },
        { coordinate: 'A3' }
      ]
      created_cells = Cell.create_multiple_cells(cells)
      @board.cells

      expect(@board.cells).to be_an_instance_of(Hash)
      expect(@board.valid_coordinate?('A1')).to be true
    end

    it 'can validate ship placement by length' do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq true
      expect(@board.valid_placement?(@submarine, ["A1"])).to eq false
    end

    it 'can validate placement by checking consecutive coordinates' do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq false
      expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq false
      expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq false
      expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq false
      expect(@board.valid_placement?(@submarine, ["B1", "B2"])).to eq true
    end
  end
end