class Board
    attr_reader :cells
    def initialize(cells)
        @cells = create_cells
    end

    def create_cells
        cells = [
        {coordinate: "A1"},
        {coordinate: "A2"},
        {coordinate: "A3"},
        {coordinate: "A4"},
        {coordinate: "B1"},
        {coordinate: "B2"},
        {coordinate: "B3"},
        {coordinate: "B4"},
        {coordinate: "C1"},
        {coordinate: "C2"},
        {coordinate: "C3"},
        {coordinate: "C4"},
        {coordinate: "D1"},
        {coordinate: "D2"},
        {coordinate: "D3"},
        {coordinate: "D4"}
        ]
      

        all_cells = Cell.create_multiple_cells(cells)
        cells_hash = {}
        all_cells.each do |cell|
            cells_hash[cell.coordinate] = cell
            
        end
        cells_hash
    end
    
    

    def valid_coordinate?(coordinate)
        cells.key?(coordinate)
    end

    def valid_length?(ship , coordinates)
        ship.length == coordinates.length
    end
    
    def valid_placement?(ship, coordinates)
        
        if valid_length?(ship , coordinates) && ((row_valid?(coordinates)) && (column_consecutive?(coordinates)) || 
            (row_consecutive?(coordinates)) && ((column_valid?(coordinates))))
            true
        else
            false
        end
        
    end

    def rows(coordinates)
        rows = coordinates.map{|coordinate| coordinate[0]}

        rows.uniq
        # #["A","B","C","D"]
    end
    
    def columns(coordinates)
        all_columns = coordinates.map{|coordinate| coordinate[1].to_i}
        all_columns.uniq
    end

    def row_valid?(coordinates)
    
        rows(coordinates).uniq.length == 1
    end

    def column_valid?(coordinates)
        columns(coordinates).uniq.length == 1
    end

    def column_consecutive?(coordinates)
        columns(coordinates).each_cons(2).all? do |a, b| 
            a.succ == b
        end
    end

    def row_consecutive?(rows)

        rows.each_cons(2).all? do|a, b| 
            a.ord.succ == b.ord
        end
    end

    def place(ship, coordinates)
        if valid_placement?(ship, coordinates)
            coordinates.each do |coordinate|
          cell = cells[coordinate]
            
          cell.place_ship(ship) 
        
            end
        end
    end

    def render(value = false)
        top_row = ' ' + columns.join(' ') + "\n"
        
        board_rows = rows(coordinates).map do |row|
            row_cells = columns.map do |col|
            cells["#{row}#{col}"].render(value)
            end
            "#{row} " + row_cells.join(' ') + "\n"
            # require 'pry': binding.pry
        end
    
        top_row + board_rows.join 
    end                           
        
end
