require 'parrot'

class AfricanParrot < Parrot
    def initialize number_of_coconuts
        @number_of_coconuts = number_of_coconuts
    end

    def speed
        [0, base_speed - load_factor * @number_of_coconuts].max
    end

    def load_factor
        9.0
      end
end