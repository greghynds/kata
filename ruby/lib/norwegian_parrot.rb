require 'parrot'

class NorwegianParrot < Parrot

    def initialize voltage
        @voltage = voltage
    end 

    def speed
        speed_for_voltage(@voltage)
    end

    def speed_for_voltage voltage
        [MIN_SPEED, voltage * BASE_SPEED].min
    end
    
    private 

    MIN_SPEED = 24.0
end