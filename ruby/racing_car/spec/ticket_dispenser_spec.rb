require 'ticket_dispenser'

describe TicketDispenser do
  it "dispenses a ticket with the next turn number" do
    expected = Ticket.new(0).number
    sut = TicketDispenser.new(TicketSequence.new)
    
    actual = sut.dispense.number

    expect(actual).to eq(expected)
  end
end