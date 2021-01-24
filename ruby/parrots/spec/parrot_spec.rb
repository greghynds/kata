require 'parrot'

describe "Parrot" do
  it "calculates speed of a European parrot" do
    sut = Parrot.new(:european_parrot)
    expected = 12.0
    
    actual = sut.speed

    expect(actual).to eq(expected)
  end

  it "calculates speed of an African parrot with one coconut" do
    sut = Parrot.new(:african_parrot, number_of_coconuts: 1)
    expected = 3.0

    actual = sut.speed

    expect(actual).to eq(expected)
  end

  it "calculates speed of an African parrot with two coconuts" do
    sut = Parrot.new(:african_parrot, number_of_coconuts: 2)
    expected = 0.0

    actual = sut.speed

    expect(actual).to eq(expected)
  end

  it "calculates speed of an African parrot with no coconuts" do
    sut = Parrot.new(:african_parrot, number_of_coconuts: 0)
    expected = 12.0

    actual = sut.speed

    expect(actual).to eq(expected)
  end

  it "calculates speed of a nailed Norwegian blue parrot" do
    sut = Parrot.new(:norwegian_blue_parrot, voltage: 1.5, nailed: true)
    expected = 0.0

    actual = sut.speed

    expect(actual).to eq(expected)
  end

  it "calculates speed of a not nailed Norwegian blue parrot" do
    sut = Parrot.new(:norwegian_blue_parrot, voltage: 1.5)
    expected = 18.0

    actual = sut.speed

    expect(actual).to eq(expected)
  end

  it "calculates speed of a not nailed Norwegian blue parrot with high voltage" do
    sut = Parrot.new(:norwegian_blue_parrot, voltage: 4)
    expected = 24.0

    actual = sut.speed

    expect(actual).to eq(expected)
  end

  it "returns speed of zero for unknown types of parrot" do
    sut = Parrot.new(:unknown_parrot)
    expected = 0.0

    actual = sut.speed

    expect(actual).to eq(expected)
  end
end