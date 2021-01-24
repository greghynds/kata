require 'parrot_speed'

class AfricanParrot
    include ParrotSpeed

    LOAD_FACTOR = 9.0
    private_constant :LOAD_FACTOR

    def initialize(number_of_coconuts)
        @number_of_coconuts = number_of_coconuts
    end

    def speed
        [0, BASE_SPEED - LOAD_FACTOR * @number_of_coconuts].max
    end
end