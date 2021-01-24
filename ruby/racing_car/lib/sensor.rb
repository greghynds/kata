require 'random_pressure'

class Sensor
    OFFSET = 16

    def initialize(source: RandomPressure.new)
        @source = source
    end
      
    def pop_next_pressure_psi_value
        OFFSET + sample_pressure
    end
  
    def sample_pressure
        @source.sample_pressure
    end
end




  
