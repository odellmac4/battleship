require './lib/board'
require './lib/cell'
require './lib/ship'
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
  end

  describe 'rows' do
    it 'has rows' do
      expect(@board.rows).to eq (["A" , "B" , "C" , "D"])
    end

    it 'has the same row/letter in each coordinate' do

      expect(@board.row_valid?(["A1", "A2", "A3"])).to be true
      expect(@board.row_valid?(["A1", "B2", "C3"])).to be false
    end

    it 'has consecutive rows/letters' do

      coordinates = ["A1", "A2", "A3"]

      expect(@board.row_consecutive?(["A1", "B1", "C1"])).to eq true
      # require'pry';binding.pry
      expect(@board.row_consecutive?(["A1", "A2", "A3"])).to eq false
    end
    
  end

  describe 'columns' do
    it 'has columns' do
      expect(@board.columns).to eq ([1, 2, 3, 4])
    end

    it 'has the consecutive columns/numbers' do

      expect(@board.column_consecutive?(["A1", "A2", "A3"])).to be true
      expect(@board.column_consecutive?(["B3", "B4", "B1"])).to be false
      expect(@board.column_consecutive?(["C4", "C2", "C3"])).to be false
      
    end

    it 'has the same column/number in each coordinate' do
      expect(@board.column_valid?(["A1", "B1", "C1"])).to eq true
      expect(@board.column_valid?(["A1", "B3", "C4"])).to eq false
    end
  end

  describe 'validates placement' do
    it 'can validate ship placement by length' do
      expect(@board.valid_length?(@cruiser, ["A1", "A2", "A3"])).to eq true
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq true
      expect(@board.valid_placement?(@submarine, ["A1"])).to eq false
    end

    it 'validate ship placemnt consecutive rows and columns and same row and column' do
        expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq false
        expect(@board.valid_placement?(@submarine, ["B1", "B2"])).to eq true
        expect(@board.valid_placement?(@submarine, ["C1", "C2" , "C3"])).to eq false
        
        expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq false
        expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq false
        expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq false
        
      end
  end
end

