require 'ticket_sequence'
  
Ticket = Struct.new(:number)

class TicketDispenser
    def initialize(sequence) 
        @sequence = sequence
    end

    def dispense
        Ticket.new(@sequence.next)
    end
end