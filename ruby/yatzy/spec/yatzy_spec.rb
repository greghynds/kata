require 'yatzy'

describe "Yatzy" do
    it "chance scores sum of all dice" do
        expected = 15

        actual = Yatzy.chance(2,3,4,5,1)

        expect(actual).to eq(expected)
        expect(16).to eq(Yatzy.chance(3,3,4,5,1))
    end

    it "yatzy scores 50" do
        expected = 50

        actual = Yatzy.yatzy([4,4,4,4,4])
        
        expect(actual).to eq(expected)
        expect(50).to eq(Yatzy.yatzy([6,6,6,6,6]))
        expect(0).to eq(Yatzy.yatzy([6,6,6,6,3]))
    end

    it "ones" do
        expect(Yatzy.ones(1,2,3,4,5)).to eq(1)
        expect(2).to eq(Yatzy.ones(1,2,1,4,5))
        expect(0).to eq(Yatzy.ones(6,2,2,4,5))
        expect(4).to eq(Yatzy.ones(1,2,1,1,1))
    end

    it "twos" do
        expect(Yatzy.twos(1,2,3,2,6)).to eq(4)
        expect(Yatzy.twos(2,2,2,2,2)).to eq(10)
    end

    it "threes" do
        expect(Yatzy.threes(1,2,3,2,3)).to eq(6)
        expect(Yatzy.threes(2,3,3,3,3)).to eq(12)
    end

    it "fours" do
        expect(12).to eq(Yatzy.new(4,4,4,5,5).fours)
        expect(8).to eq(Yatzy.new(4,4,5,5,5).fours)
        expect(4).to eq(Yatzy.new(4,5,5,5,5).fours)
    end

    it "fives" do
        expect(10).to eq(Yatzy.new(4,4,4,5,5).fives())
        expect(15).to eq(Yatzy.new(4,4,5,5,5).fives())
        expect(20).to eq(Yatzy.new(4,5,5,5,5).fives())
    end

    it "sixes" do
        expect(0).to eq(Yatzy.new(4,4,4,5,5).sixes())
        expect(6).to eq(Yatzy.new(4,4,6,5,5).sixes())
        expect(18).to eq(Yatzy.new(6,5,6,6,5).sixes())
    end

    it "one pair" do
        expect(6).to eq(Yatzy.score_pair(3,4,3,5,6))
        expect(10).to eq(Yatzy.score_pair(5,3,3,3,5))
        expect(12).to eq(Yatzy.score_pair(5,3,6,6,5))
    end

    it "two pair" do
        expect(16).to eq(Yatzy.two_pair(3,3,5,4,5))
        expect(16).to eq(Yatzy.two_pair(3,3,5,5,5))
    end

    it "three of a kind" do
        expect(9).to eq(Yatzy.three_of_a_kind(3,3,3,4,5))
        expect(15).to eq(Yatzy.three_of_a_kind(5,3,5,4,5))
        expect(9).to eq(Yatzy.three_of_a_kind(3,3,3,3,5))
    end

    it "four of a kind" do
        expect(12).to eq(Yatzy.four_of_a_kind(3,3,3,3,5))
        expect(20).to eq(Yatzy.four_of_a_kind(5,5,5,4,5))
        expect(9).to eq(Yatzy.three_of_a_kind(3,3,3,3,3))
        expect(12).to eq(Yatzy.four_of_a_kind(3,3,3,3,3))
    end

    it "small straight" do
        expect(15).to eq(Yatzy.smallStraight(1,2,3,4,5))
        expect(15).to eq(Yatzy.smallStraight(2,3,4,5,1))
        expect(0).to eq(Yatzy.smallStraight(1,2,2,4,5))
    end

    it "large straight" do
        expect(20).to eq(Yatzy.largeStraight(6,2,3,4,5))
        expect(20).to eq(Yatzy.largeStraight(2,3,4,5,6))
        expect(0).to eq(Yatzy.largeStraight(1,2,2,4,5))
    end

    it "full house" do
        expect(18).to eq(Yatzy.fullHouse(6,2,2,2,6))
        expect(0).to eq(Yatzy.fullHouse(2,3,4,5,6))
    end
end

#   def test_fullHouse()
#     assert 18 == Yatzy.fullHouse(6,2,2,2,6)
#     assert 0 == Yatzy.fullHouse(2,3,4,5,6)
#   end
# end