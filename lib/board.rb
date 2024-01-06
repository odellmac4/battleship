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
      
    end
    
    

    def valid_coordinate?(coordinate)
        cells_validation_array = []
        cells.each do |key, value|
        cells_validation_array << key
       end
       cells_validation_array.include?(coordinate)
    end

    def validate_length(ship , coordinates)
        ship.length == coordinates.length
        require'pry';binding.pry
    end
    
    def validate_order
        row1 = cells.keys[0..3]
        row2 = cells.keys[4..7]
        row1 = cells.keys[8..11]
        row1 = cells.keys[12..16]
    end

    def valid_placement?(ship, coordinates)
        validate_length(ship , coordinates)
    end
    
end

#keys of the cells
#first range to be A1..A4

# arr.sort { |a, b| a <=> b }
# Syntax: .each_cons(N) { |obj| block }