require 'diamond_quadrant'

class Diamond
    def self.for(letter, filler = '.')
        quadrant = DiamondQuadrant.new(letter, filler)
        top_right = quadrant.for(:top_right)
        top_left = quadrant.for(:top_left)
        bottom_right = quadrant.for(:bottom_right)
        bottom_left = quadrant.for(:bottom_left)
        top_row = join_horizontal(top_left, top_right)
        bottom_row = join_horizontal(bottom_left, bottom_right)
        
        join_vertical(top_row, bottom_row)
    end

    private

    def self.join_horizontal(left, right)
        left.each_with_index.map do |row, i|
            row[0, row.length - 1] + right[i]
        end
    end

    def self.join_vertical(top, bottom)
        top.take(top.length - 1) + bottom
    end
end