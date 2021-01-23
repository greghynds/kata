require 'european_parrot'
require 'norwegian_parrot'
require 'african_parrot'

class ParrotFactory

    def initialize type, number_of_coconuts, voltage, nailed
      @type = type
      @number_of_coconuts = number_of_coconuts
      @voltage = voltage
      @nailed = nailed
    end
  
    def speed
      case @type
      when :european_parrot
        EuropeanParrot.new.speed
      when :african_parrot
        AfricanParrot.new(@number_of_coconuts).speed
      when :norwegian_blue_parrot
        NorwegianParrot.new(@voltage, @nailed).speed
      end
    end
end