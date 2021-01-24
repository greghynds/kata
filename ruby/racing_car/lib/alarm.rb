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
        @is_alarm_on = !@sensor.pressure_psi.between?(MIN_PRESSURE, MAX_PRESSURE)
    end
end