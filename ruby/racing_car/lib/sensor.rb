require 'random_pressure'

class Sensor
    OFFSET = 16

    def initialize(source)
        @source = source
    end
      
    def pop_next_pressure_psi_value
        OFFSET + @source.sample_pressure
    end
end
