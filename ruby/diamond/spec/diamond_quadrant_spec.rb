require 'diamond_quadrant'

describe DiamondQuadrant do
  it "returns top right quadrant for A" do
    expected = ['A']
    actual = DiamondQuadrant.new('A', '.').for(:top_right)

    expect(actual).to eq(expected)
  end
  it "returns top right quadrant for B" do
    expected = ['A.', '.B']
    actual = DiamondQuadrant.new('B', '.').for(:top_right)

    expect(actual).to eq(expected)
  end
  it "returns top right quadrant for C" do
    expected = ['A..', '.B.', '..C']
    actual = DiamondQuadrant.new('C', '.').for(:top_right)

    expect(actual).to eq(expected)
  end
  it "returns top left quadrant for A" do
    expected = ['A']
    actual = DiamondQuadrant.new('A', '.').for(:top_left)

    expect(actual).to eq(expected)
  end
  it "returns top left quadrant for B" do
    expected = ['.A', 'B.']
    actual = DiamondQuadrant.new('B', '.').for(:top_left)

    expect(actual).to eq(expected)
  end
  it "returns top left quadrant for C" do
    expected = ['..A', '.B.', 'C..']
    actual = DiamondQuadrant.new('C', '.').for(:top_left)

    expect(actual).to eq(expected)
  end
  it "returns bottom right quadrant for A" do
    expected = ['A']
    actual = DiamondQuadrant.new('A', '.').for(:bottom_right)

    expect(actual).to eq(expected)
  end
  it "returns bottom right quadrant for B" do
    expected = ['.B', 'A.']
    actual = DiamondQuadrant.new('B', '.').for(:bottom_right)

    expect(actual).to eq(expected)
  end
  it "returns bottom right quadrant for C" do
    expected = ['..C', '.B.', 'A..']
    actual = DiamondQuadrant.new('C', '.').for(:bottom_right)

    expect(actual).to eq(expected)
  end
  it "returns bottom left quadrant for A" do
    expected = ['A']
    actual = DiamondQuadrant.new('A', '.').for(:bottom_left)

    expect(actual).to eq(expected)
  end
  it "returns bottom left quadrant for B" do
    expected = ['B.', '.A']
    actual = DiamondQuadrant.new('B', '.').for(:bottom_left)

    expect(actual).to eq(expected)
  end
  it "returns bottom right quadrant for C" do
    expected = ['C..', '.B.', '..A']
    actual = DiamondQuadrant.new('C', '.').for(:bottom_left)

    expect(actual).to eq(expected)
  end
end