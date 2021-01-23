require 'parrot'

class NorwegianBlueParrot < Parrot

    def initialize(voltage)
        @voltage = voltage
    end 

    def speed
        [MIN_SPEED, @voltage * BASE_SPEED].min
    end

    private 

    MIN_SPEED = 24.0
end