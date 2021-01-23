require 'parrot'

class NorwegianParrot < Parrot

    def initialize voltage, nailed
        @voltage = voltage
        @nailed = nailed
    end

    def speed
        (@nailed) ? 0 : compute_base_speed_for_voltage(@voltage)
    end

    def compute_base_speed_for_voltage voltage
        [24.0, voltage * base_speed].min
    end
end