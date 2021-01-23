require 'european_parrot'
require 'norwegian_parrot'
require 'african_parrot'

class ParrotFactory

    def initialize type, number_of_coconuts, voltage, nailed
      @parrot = case type
      when :european_parrot
        EuropeanParrot.new
      when :african_parrot
        AfricanParrot.new(number_of_coconuts)
      when :norwegian_blue_parrot
        NorwegianParrot.new(voltage, nailed)
      end
    end
  
    def speed
      @parrot.speed
    end
end