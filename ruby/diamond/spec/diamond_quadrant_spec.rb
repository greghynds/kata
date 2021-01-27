require 'diamond_quadrant'

describe DiamondQuadrant do
  it "number of rows for A is 1" do
    actual = DiamondQuadrant.for('A')

    expect(actual.length).to eq(1)
  end
  it "number of rows for B is 2" do
    actual = DiamondQuadrant.for('B')

    expect(actual.length).to eq(2)
  end
  it "number of rows for C is 3" do
    actual = DiamondQuadrant.for('C')

    expect(actual.length).to eq(3)
  end
end