require 'european_parrot'
require 'norwegian_blue_parrot'
require 'african_parrot'
require 'nailed_parrot'

class Parrot

    def initialize(type, number_of_coconuts: 0, voltage: 0.0, nailed: false)
      @parrot = case type
      when :european_parrot then EuropeanParrot.new
      when :african_parrot then AfricanParrot.new(number_of_coconuts)
      when :norwegian_blue_parrot then (nailed) ?  NailedParrot.new : NorwegianBlueParrot.new(voltage)
      else NailedParrot.new
      end
    end
  
    def speed
      @parrot.speed
    end
end