require 'parrot_factory'

describe "ParrotFactory" do
  it "calculates speed of a European parrot" do
    parrot = ParrotFactory.new(:european_parrot)
    expect(parrot.speed).to eq(12.0)
  end

  it "calculates speed of an African parrot with one coconut" do
    parrot = ParrotFactory.new(:african_parrot, number_of_coconuts: 1)
    expect(parrot.speed).to eq(3.0)
  end

  it "calculates speed of an African parrot with two coconuts" do
    parrot = ParrotFactory.new(:african_parrot, number_of_coconuts: 2)
    expect(parrot.speed).to eq(0.0)
  end

  it "calculates speed of an African parrot with no coconuts" do
    parrot = ParrotFactory.new(:african_parrot, number_of_coconuts: 0)
    expect(parrot.speed).to eq(12.0)
  end

  it "calculates speed of a nailed Norwegian blue parrot" do
    parrot = ParrotFactory.new(:norwegian_blue_parrot, voltage: 1.5, nailed: true)
    expect(parrot.speed).to eq(0.0)
  end

  it "calculates speed of a not nailed Norwegian blue parrot" do
    parrot = ParrotFactory.new(:norwegian_blue_parrot, voltage: 1.5)
    expect(parrot.speed).to eq(18.0)
  end

  it "calculates speed of a not nailed Norwegian blue parrot with high voltage" do
    parrot = ParrotFactory.new(:norwegian_blue_parrot, voltage: 4)
    expect(parrot.speed).to eq(24.0)
  end

  it "returns speed of zero for unknown types of parrot" do
    parrot = ParrotFactory.new(:unknown_parrot)
    expect(parrot.speed).to eq(0.0)
  end
end