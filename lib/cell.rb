class Cell

    attr_reader :coordinate,
                :ship

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @empty = true
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
        if value == true && !fired_upon? && @ship != nil
            "S"
        elsif !fired_upon?
             "."
        elsif fired_upon? && @ship.nil?
             "M"
        elsif fired_upon? && !@ship.sunk?
             "H"
        elsif fired_upon? && @ship.sunk?
             "X"
        end
    end

    def self.create_multiple_cells(cells)
        cells.map do |cell|
            new_cell = Cell.new(cell[:coordinate])
        end
    end
end