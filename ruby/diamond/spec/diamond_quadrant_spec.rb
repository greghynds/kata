require 'diamond_quadrant'

describe DiamondQuadrant do
  it "returns top right quadrant for A" do
    expected = ['A']
    actual = DiamondQuadrant.for('A', :top_right)

    expect(actual).to eq(expected)
  end
  it "returns top right quadrant for B" do
    expected = ['A.', '.B']
    actual = DiamondQuadrant.for('B', :top_right)

    expect(actual).to eq(expected)
  end
  it "returns top right quadrant for C" do
    expected = ['A..', '.B.', '..C']
    actual = DiamondQuadrant.for('C', :top_right)

    expect(actual).to eq(expected)
  end

  it "returns top left quadrant for A" do
    expected = ['A']
    actual = DiamondQuadrant.for('A', :top_left)

    expect(actual).to eq(expected)
  end
  it "returns top left quadrant for B" do
    expected = ['.A', 'B.']
    actual = DiamondQuadrant.for('B', :top_left)

    expect(actual).to eq(expected)
  end
  it "returns top left quadrant for C" do
    expected = ['..A', '.B.', 'C..']
    actual = DiamondQuadrant.for('C', :top_left)

    expect(actual).to eq(expected)
  end

  it "returns bottom right quadrant for A" do
    expected = ['A']
    actual = DiamondQuadrant.for('A', :bottom_right)

    expect(actual).to eq(expected)
  end
  it "returns bottom right quadrant for B" do
    expected = ['.B', 'A.']
    actual = DiamondQuadrant.for('B', :bottom_right)

    expect(actual).to eq(expected)
  end
  it "returns bottom right quadrant for C" do
    expected = ['..C', '.B.', 'A..']
    actual = DiamondQuadrant.for('C', :bottom_right)

    expect(actual).to eq(expected)
  end
end