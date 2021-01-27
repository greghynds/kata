require 'diamond_quadrant'

describe DiamondQuadrant do
  it "returns top right quadrant for A" do
    expected = ['A']
    actual = DiamondQuadrant.new('A', '.').row(:top_right)

    expect(actual).to eq(expected)
  end
  it "returns top right quadrant for B" do
    expected = ['A.', '.B']
    actual = DiamondQuadrant.new('B', '.').row(:top_right)

    expect(actual).to eq(expected)
  end
  it "returns top right quadrant for C" do
    expected = ['A..', '.B.', '..C']
    actual = DiamondQuadrant.new('C', '.').row(:top_right)

    expect(actual).to eq(expected)
  end
  it "returns top left quadrant for A" do
    expected = ['A']
    actual = DiamondQuadrant.new('A', '.').row(:top_left)

    expect(actual).to eq(expected)
  end
  it "returns top left quadrant for B" do
    expected = ['.A', 'B.']
    actual = DiamondQuadrant.new('B', '.').row(:top_left)

    expect(actual).to eq(expected)
  end
  it "returns top left quadrant for C" do
    expected = ['..A', '.B.', 'C..']
    actual = DiamondQuadrant.new('C', '.').row(:top_left)

    expect(actual).to eq(expected)
  end
  it "returns bottom right quadrant for A" do
    expected = ['A']
    actual = DiamondQuadrant.new('A', '.').row(:bottom_right)

    expect(actual).to eq(expected)
  end
  it "returns bottom right quadrant for B" do
    expected = ['.B', 'A.']
    actual = DiamondQuadrant.new('B', '.').row(:bottom_right)

    expect(actual).to eq(expected)
  end
  it "returns bottom right quadrant for C" do
    expected = ['..C', '.B.', 'A..']
    actual = DiamondQuadrant.new('C', '.').row(:bottom_right)

    expect(actual).to eq(expected)
  end
  it "returns bottom left quadrant for A" do
    expected = ['A']
    actual = DiamondQuadrant.new('A', '.').row(:bottom_left)

    expect(actual).to eq(expected)
  end
  it "returns bottom left quadrant for B" do
    expected = ['B.', '.A']
    actual = DiamondQuadrant.new('B', '.').row(:bottom_left)

    expect(actual).to eq(expected)
  end
  it "returns bottom right quadrant for C" do
    expected = ['C..', '.B.', '..A']
    actual = DiamondQuadrant.new('C', '.').row(:bottom_left)

    expect(actual).to eq(expected)
  end
end