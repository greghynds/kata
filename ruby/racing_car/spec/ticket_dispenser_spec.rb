require 'ticket_dispenser'

describe TicketDispenser do
  it "dispenses a ticket with the next number" do
    expected = 0
    sut = TicketDispenser.new(TicketSequence.new)
    
    actual = sut.dispense.number

    expect(actual).to eq(expected)
  end
  it "dispenses a second ticket with a higher number than the first" do
    sut = TicketDispenser.new(TicketSequence.new)
    
    first = sut.dispense.number
    second = sut.dispense.number

    expect(first).to eq(0)
    expect(second).to eq(1)
  end
  it "keeps in sync with other dispensers" do
    sequence = TicketSequence.new
    dispenser1 = TicketDispenser.new(sequence)
    dispenser2 = TicketDispenser.new(sequence)
    
    first = dispenser1.dispense.number
    second = dispenser2.dispense.number

    expect(first).to eq(0)
    expect(second).to eq(1)
  end
end