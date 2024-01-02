class Cell

    attr_reader :coordinate,
                :ship

    def initialize(coordinate , empty = true)
        @coordinate = coordinate
        @ship = nil
        @empty = empty
    end

    def empty?
        @empty
    end
end