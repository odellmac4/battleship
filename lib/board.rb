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
    #   require'pry';binding.pry
    end
    
    

    def valid_coordinate?(coordinate)
    #     cells_validation_array = []
    #     cells.each do |key, value|
    #     cells_validation_array << key
    #    end
    #    cells_validation_array.include?(coordinate)
        cells.key?(coordinate)
    end

    def valid_length?(ship , coordinates)
        ship.length == coordinates.length
    end
    
    
    # def validate_horizontal(columns , rows , length)
    #     # assign the row to the letters
    #     # assign the column to the numbers
        
    # end
    
    def valid_placement?(ship, coordinates)
        rows = coordinates.map {|coordinate| coordinate[0]}
        columns = coordinates.map {|coordinate| coordinate[1].to_i}
        
        valid_length?(ship , coordinates)

        

        # row_valid?(rows)
        # column_valid?(columns)



        # require'pry';binding.pry
    end

    def rows
        all_cells_keys = [
            cells.keys[0..15],
            # cells.keys[4..7],
            # cells.keys[8..11],
            # cells.keys[12..15]
        ]

        separate_coord_chars = all_cells_keys.flat_map do |keys|
            keys.map{|coordinate| coordinate.split("")}
        end

        rows = separate_coord_chars.map do |coord_chars|
            coord_chars[0]
        end

        rows.uniq

        

        rows.uniq
        #["A","B","C","D"]
    end
    # require'pry';binding.pry
    def columns
        all_cells_keys = [
            cells.keys[0..15],
            # cells.keys[4..7],
            # cells.keys[8..11],
            # cells.keys[12..15]
        ]

        separate_coord_chars = all_cells_keys.flat_map do |keys|
            keys.map{|coordinate| coordinate.split("")}
        end

        columns = separate_coord_chars.map do |coord_chars|
            coord_chars[1]
        end

        columns.uniq.map{|num| num.to_i}
        #NUMBERS
        [1, 2, 3, 4]
    end

    def row_valid?(coordinates)
        rows = coordinates.map{|coordinate| coordinate[0]}
        rows.uniq.length == 1
    end

    def column_consecutive?(coordinates)
        columns = coordinates.map{|coordinate| coordinate[1].to_i}
        columns.each_cons(2).all? {|a, b| a <= b}
        # require'pry';binding.pry
    end

    
end

#keys of the cells
#first range to be A1..A4

# arr.sort { |a, b| a <=> b }
# Syntax: .each_cons(N) { |obj| block }