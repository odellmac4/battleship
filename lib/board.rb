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
       
        # require 'pry'; binding.pry
        cells_validation_array.include?(coordinate)
            # coordinate == coordinate
        # end
    end

    # def valid_horizontal
    #     cells.keys
    #     # require 'pry'; binding.pry
    # end

    

    def valid_placement?(ship, coordinates)
        ship.length == coordinates.length
            # arr.sort { |a, b| a <=> b }
    #         true
    #         # Syntax: .each_cons(N) { |obj| block }

    #         # range hash horizontal, range hash of arrays vertical x4 transcribed to numerical values to reference

    #         # {["a1", "a2"...]}
        end  #         # {["a1", "b1"...]} transcribed to ord for numerical values, compare in sequence?
    
            
    #     end

end
    
