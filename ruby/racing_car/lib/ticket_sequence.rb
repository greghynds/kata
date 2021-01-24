class TicketSequence
    def initialize(start: -1)
        @number = start
    end

    def next
        @number += 1
        @number
    end
end