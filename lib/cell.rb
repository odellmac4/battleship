class Cell

    attr_reader :coordinate,
                :ship

    def initialize(coordinate , empty = true)
        @coordinate = coordinate
        @ship = nil
        @empty = empty
        @fired_upon = false
    end

    def empty?
        @empty
    end

    def place_ship(ship)
        @ship = ship
        @empty = false
    end

    def fired_upon?
        @fired_upon
    end

    def fire_upon
        @ship.hit if @ship != nil
        @fired_upon = true
    end

    def render(value = false)
        if value == true && fired_upon? == false && @ship != nil
            "S"
        elsif fired_upon? == false
             "."
        elsif fired_upon? == true && @ship.nil?
             "M"
        elsif fired_upon? == true && @ship.sunk? == false
             "H"
        elsif fired_upon? == true && @ship.sunk? == true
             "X"
        end
    end

    def self.create_multiple_cells(cells)
        cells.map do |cell|
            new_cell = Cell.new(cell[:coordinate])
        end
    end
end