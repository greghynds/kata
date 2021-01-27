require 'diamond_quadrant'

class Diamond
    def self.for(letter, filler = '.')
        top_right = DiamondQuadrant.for(letter, :top_right, filler)
        top_left = DiamondQuadrant.for(letter, :top_left, filler)
        bottom_right = DiamondQuadrant.for(letter, :bottom_right, filler)
        bottom_left = DiamondQuadrant.for(letter, :bottom_left, filler)

        top_row = join_horizontal(top_left, top_right)
        bottom_row = join_horizontal(bottom_left, bottom_right)
        
        join_vertical(top_row, bottom_row)
    end

    def self.join_horizontal(left, right)
        left.each_with_index.map do |row, i|
            row[0, row.length - 1] + right[i]
        end
    end

    def self.join_vertical(top, bottom)
        top.take(top.length - 1) + bottom
    end
end