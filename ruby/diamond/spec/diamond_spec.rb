require 'diamond'

describe Diamond do
  it "returns diamond for A" do
    expected = ['A']
    
    actual = Diamond.for('A')

    expect(actual).to eq(expected)
  end
  it "returns diamond for B" do
    expected = ['.A.', 'B.B', '.A.']
    
    actual = Diamond.for('B')

    expect(actual).to eq(expected)
  end
  it "returns diamond for C" do
    expected = ['..A..', '.B.B.', 'C...C', '.B.B.', '..A..']
    
    actual = Diamond.for('C')

    expect(actual).to eq(expected)
  end
  it "returns diamond for D" do
    expected = ['...A...', '..B.B..', '.C...C.', 'D.....D', '.C...C.', '..B.B..', '...A...']
    
    actual = Diamond.for('D')

    expect(actual).to eq(expected)
  end
  it "returns diamond with given filler character" do
    expected = ['*A*', 'B*B', '*A*']
    
    actual = Diamond.for('B', "*")

    expect(actual).to eq(expected)
  end
  it "prints" do
    puts Diamond.for('K', ' ')
  end
end