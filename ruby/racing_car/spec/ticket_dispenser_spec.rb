require 'ticket_dispenser'

describe TicketDispenser do
  it "dispenses a ticket with the next turn number" do
    expected = TurnTicket.new(0).number
    sut = TicketDispenser.new
    
    actual = sut.next.number

    expect(actual).to eq(expected)
  end
end