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
        if fired_upon? == false
          puts  "."
        elsif fired_upon? == true && @ship.nil?
            puts "M"
        elsif fired_upon? == true && @ship != nil
            puts "H"
        elsif fired_upon? == true && @ship.sunk? == true
            puts "X"
        elsif value == true && fired_upon? == false && @ship != nil
            puts "S"
        end
    end
end