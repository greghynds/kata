require 'diamond'

describe Diamond do
  it "returns diamond for A" do
    expected = ['A']
    
    actual = Diamond.new('A').rows

    expect(actual).to eq(expected)
  end
  it "returns diamond for B" do
    expected = ['.A.', 'B.B', '.A.']
    
    actual = Diamond.new('B').rows

    expect(actual).to eq(expected)
  end
  it "returns diamond for C" do
    expected = ['..A..', '.B.B.', 'C...C', '.B.B.', '..A..']
    
    actual = Diamond.new('C').rows

    expect(actual).to eq(expected)
  end
  it "returns diamond for D" do
    expected = ['...A...', '..B.B..', '.C...C.', 'D.....D', '.C...C.', '..B.B..', '...A...']
    
    actual = Diamond.new('D').rows

    expect(actual).to eq(expected)
  end
  it "returns diamond with given filler character" do
    expected = ['*A*', 'B*B', '*A*']
    
    actual = Diamond.new('B', "*").rows

    expect(actual).to eq(expected)
  end
end