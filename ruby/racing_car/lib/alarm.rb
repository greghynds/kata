require 'sensor'

class Alarm
    MIN_PRESSURE = 17
    MAX_PRESSURE = 21
    private_constant :MIN_PRESSURE
    private_constant :MAX_PRESSURE

    attr_reader :is_alarm_on
  
    def initialize(sensor)
        @sensor = sensor
        @is_alarm_on = false
    end
        
    def check
        psi_pressure_value = @sensor.pressure_psi
      
        if psi_pressure_value < MIN_PRESSURE or MAX_PRESSURE < psi_pressure_value
            @is_alarm_on = true
        end
    end
end