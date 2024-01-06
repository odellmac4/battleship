class Board

    def cells
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
      require'pry';binding.pry
    end
    
    

    def valid_coordinate?(coordinate)
    #     cells_validation_array = []
    #     cells.each do |key, value|
    #     cells_validation_array << key
    #    end
    #    cells_validation_array.include?(coordinate)
        cells.key?(coordinate)
    end

    def validate_length(ship , coordinates)
        ship.length == coordinates.length
        # require'pry';binding.pry
    end
    
    
    # def validate_horizontal(columns , rows , length)
    #     # assign the row to the letters
    #     # assign the column to the numbers
        
    # end
    
    def valid_placement?(ship, coordinates)
        validate_length(ship , coordinates)

        columns = coordinates.map {|coordinate| coordinate[0]}
        rows = coordinates.map {|coordinate| coordinate[1].to_i}

        row_valid?(rows)
        column_valid?(columns)



        # require'pry';binding.pry
    end

    def rows
        all_rows = [
            cells_hash.keys[0..3],
            cells_hash.keys[4..7],
            cells_hash.keys[8..11],
            cells_hash.keys[12..15]
        ]

        separate_coord_chars = all_rows.flat_map do |row|
            row.map{|coord| coord.split("")}
        end

        row_assign = separate_coord_chars.map do |coord_pair|
            coord_pair[0]
        end

        row_assign.uniq
        #LETTERS
    end

    def columns
        all_columns = [
            cells_hash.keys[0..3],
            cells_hash.keys[4..7],
            cells_hash.keys[8..11],
            cells_hash.keys[12..15]
        ]

        separate_coord_chars = all_columns.flat_map do |column|
            column.map{|coord| coord.split("")}
        end

        column_assign = separate_coord_chars.map do |coord_pair|
            coord_pair[1]
        end

        column_assign.uniq.map{|num| num.to_i}
        #NUMBERS
    end

    def row_valid?(rows)
        rows.length == 1
    end

    def column_valid?(columns)
        columns.length == 1
    end


    
end

#keys of the cells
#first range to be A1..A4

# arr.sort { |a, b| a <=> b }
# Syntax: .each_cons(N) { |obj| block }