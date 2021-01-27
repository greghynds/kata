require 'diamond'

describe Diamond do
  it "prints diamond for A" do
    expected = ['A']
    
    actual = Diamond.for('A')

    expect(actual).to eq(expected)
    puts actual
  end
  it "prints diamond for B" do
    expected = ['.A.', 'B.B', '.A.']
    
    actual = Diamond.for('B')

    expect(actual).to eq(expected)
    puts actual
  end
  it "prints diamond for C" do
    expected = ['..A..', '.B.B.', 'C...C', '.B.B.', '..A..']
    
    actual = Diamond.for('C')

    expect(actual).to eq(expected)
    puts actual
  end
  it "prints diamond for D" do
    expected = ['...A...', '..B.B..', '.C...C.', 'D.....D', '.C...C.', '..B.B..', '...A...']
    
    actual = Diamond.for('D')

    expect(actual).to eq(expected)
    puts actual
  end
end