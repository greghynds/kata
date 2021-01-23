require 'parrot'

class NorwegianParrot < Parrot

    def initialize voltage, nailed
        @voltage = voltage
        @nailed = nailed
    end

    def speed
        (@nailed) ? 0 : speed_for_voltage(@voltage)
    end

    def speed_for_voltage voltage
        [MIN_SPEED, voltage * BASE_SPEED].min
    end
    
    private 

    MIN_SPEED = 24.0
end