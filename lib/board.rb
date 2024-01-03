class Board
    @cells = [
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
    
    require'pry';binding.pry

    all_cells = Cell.create_multiple_cells(@cells)

    # def cells
        
        #     # all_cells = [cell , cell]
        # cells_hash = {}
        # all_cells.each do |cell|
        #     cells_hash[cell.coordinate]
        # end
    # end
    
end