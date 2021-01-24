require 'random_pressure'

class Sensor
    OFFSET = 16

    def initialize(source)
        @source = source
    end
      
    def pressure_psi
        OFFSET + @source.sample_pressure
    end
end