require 'ticket_sequence'
require 'ticket'
  
class TicketDispenser
    def initialize(sequence) 
        @sequence = sequence
    end

    def dispense
        Ticket.new(@sequence.next)
    end
end