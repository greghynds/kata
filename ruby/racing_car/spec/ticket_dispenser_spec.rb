require 'ticket_dispenser'

describe TicketDispenser do
  it "dispenses a ticket with the next turn number" do
    expected = Ticket.new(0).number
    sut = TicketDispenser.new(TicketSequence.new)
    
    actual = sut.dispense.number

    expect(actual).to eq(expected)
  end
  it "dispenses next ticket with a higher turn number" do
    expectedFirst = Ticket.new(0).number
    expectedSecond = Ticket.new(1).number
    sut = TicketDispenser.new(TicketSequence.new)
    
    first = sut.dispense.number
    second = sut.dispense.number

    expect(first).to eq(expectedFirst)
    expect(second).to eq(expectedSecond)
  end
end