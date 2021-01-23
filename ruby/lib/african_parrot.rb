require 'parrot'

class AfricanParrot < Parrot
    def initialize number_of_coconuts
        @number_of_coconuts = number_of_coconuts
    end

    def speed
        [0, BASE_SPEED - LOAD_FACTOR * @number_of_coconuts].max
    end

    private

    LOAD_FACTOR = 9.0
end