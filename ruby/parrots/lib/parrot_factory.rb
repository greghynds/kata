require 'european_parrot'
require 'norwegian_blue_parrot'
require 'african_parrot'
require 'nailed_parrot'

class ParrotFactory

    def initialize(type, number_of_coconuts: 0, voltage: 0.0, nailed: false)
      @parrot = case type
      when :european_parrot
        EuropeanParrot.new
      when :african_parrot
        AfricanParrot.new(number_of_coconuts)
      when :norwegian_blue_parrot
        (nailed) ?  NailedParrot.new : NorwegianBlueParrot.new(voltage)
      else 
        NailedParrot.new
      end
    end
  
    def speed
      @parrot.speed
    end
end