class Yatzy
    def self.chance(d1, d2, d3, d4, d5)
      return d1 + d2 + d3 + d4 + d5
    end
  
    def self.yatzy(dice)
      counts = [0]*(dice.length+1)
      for die in dice do
        counts[die-1] += 1
      end
      for i in 0..counts.size do
        if counts[i] == 5
          return 50
        end
      end
      return 0
    end
  
    def self.ones(die1, die2, die3, die4, die5)
      roll([die1, die2, die3, die4, die5], 1)
    end
  
    def self.twos(die1, die2, die3, die4, die5)
      roll([die1, die2, die3, die4, die5], 2)
    end
  
    def self.threes(die1, die2, die3, die4, die5)
      roll([die1, die2, die3, die4, die5], 3)
    end
  
    def self.fours(die1, die2, die3, die4, die5)
      roll([die1, die2, die3, die4, die5], 4)
    end
  
    def self.fives(die1, die2, die3, die4, die5)
      roll([die1, die2, die3, die4, die5], 5)
    end
  
    def self.sixes(die1, die2, die3, die4, die5)
      roll([die1, die2, die3, die4, die5], 6)
    end

    def self.roll(rolls, category)
      sum = 0
      for i in 0..rolls.size
        if (rolls[i] == category)
          sum += category
        end
      end
      sum
    end
  
    def self.score_pair( d1,  d2,  d3,  d4,  d5)
      counts = [0]*6
      counts[d1-1] += 1
      counts[d2-1] += 1
      counts[d3-1] += 1
      counts[d4-1] += 1
      counts[d5-1] += 1
      at = 0
      (0...6).each do |at|
        if (counts[6-at-1] >= 2)
          return (6-at)*2
        end
      end
      return 0
    end
  
    def self.two_pair( d1,  d2,  d3,  d4,  d5)
      counts = [0]*6
      counts[d1-1] += 1
      counts[d2-1] += 1
      counts[d3-1] += 1
      counts[d4-1] += 1
      counts[d5-1] += 1
      n = 0
      score = 0
      for i in Array 0..5
        if (counts[6-i-1] >= 2)
          n = n+1
          score += (6-i)
        end
      end
      if (n == 2)
        return score * 2
      else
        return 0
      end
    end
  
    def self.four_of_a_kind( d1,  d2,  d3,  d4,  d5)
      tallies = [0]*6
      tallies[d1-1] += 1
      tallies[d2-1] += 1
      tallies[d3-1] += 1
      tallies[d4-1] += 1
      tallies[d5-1] += 1
      for i in (0..6)
        if (tallies[i] >= 4)
          return (i+1) * 4
        end
      end
      return 0
    end
  
    def self.three_of_a_kind( d1,  d2,  d3,  d4,  d5)
      t = [0]*6
      t[d1-1] += 1
      t[d2-1] += 1
      t[d3-1] += 1
      t[d4-1] += 1
      t[d5-1] += 1
      for i in [0,1,2,3,4,5]
        if (t[i] >= 3)
          return (i+1) * 3
        end
      end
      0
    end
  
    def self.smallStraight(d1, d2, d3, d4, d5)
      tallies = [0]*6
      tallies[d1-1] += 1
      tallies[d2-1] += 1
      tallies[d3-1] += 1
      tallies[d4-1] += 1
      tallies[d5-1] += 1
      (tallies[0] == 1 and
        tallies[1] == 1 and
        tallies[2] == 1 and
        tallies[3] == 1 and
        tallies[4] == 1) ? 15 : 0
    end
  
    def self.largeStraight(d1, d2, d3, d4, d5)
      tallies = [0]*6
      tallies[d1-1] += 1
      tallies[d2-1] += 1
      tallies[d3-1] += 1
      tallies[d4-1] += 1
      tallies[d5-1] += 1
      if (tallies[1] == 1 and tallies[2] == 1 and tallies[3] == 1 and tallies[4] == 1 and tallies[5] == 1)
        return 20
      end
      return 0
    end
  
    def self.fullHouse( d1,  d2,  d3,  d4,  d5)
      tallies = []
      x2 = false
      i = 0
      x2_at = 0
      x3 = false
      x3_at = 0
  
      tallies = [0]*6
      tallies[d1-1] += 1
      tallies[d2-1] += 1
      tallies[d3-1] += 1
      tallies[d4-1] += 1
      tallies[d5-1] += 1
  
      for i in Array 0..5
        if (tallies[i] == 2)
          x2 = true
          x2_at = i+1
        end
      end
  
      for i in Array 0..5
        if (tallies[i] == 3)
          x3 = true
          x3_at = i+1
        end
      end
  
      if (x2 and x3)
        return x2_at * 2 + x3_at * 3
      else
        return 0
      end
    end
  end