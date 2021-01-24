require 'parrot_speed'

class NorwegianBlueParrot
    include ParrotSpeed
    
    MIN_SPEED = 24.0
    private_constant :MIN_SPEED

    def initialize(voltage)
        @voltage = voltage
    end 

    def speed
        [MIN_SPEED, @voltage * BASE_SPEED].min
    end
end