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
    end

    def fired_upon?
        @fired_upon
    end

    def fire_upon
        @ship.hit
        @fired_upon = true
    end
end