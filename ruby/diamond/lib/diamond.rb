class Diamond
    def self.for(letter, filler = '.')
        @letter = letter
        @letters = ('A'..letter).to_a
        @filler = filler

        join_vertical(
            join_horizontal(quadrant_for(:top_left), quadrant_for(:top_right)),
            join_horizontal(quadrant_for(:bottom_left), quadrant_for(:bottom_right))
        )
    end

    private

    def self.join_horizontal(left, right)
        left.each_with_index.map{ |row, i| row[0, row.length - 1] + right[i] }
    end

    def self.join_vertical(top, bottom)
        top.take(top.length - 1) + bottom
    end

    def self.quadrant_for(position)
        case position
        when :top_right then top_right(@letter)
        when :top_left then top_right(@letter).map{ |x| x.reverse }
        when :bottom_right then top_right(@letter).reverse
        when :bottom_left then top_right(@letter).map{ |x| x.reverse }.reverse
        end
    end

    def self.top_right(letter)
        total_rows = @letters.index(letter) + 1
        total_rows.times.each_with_index.map do |i|
            letter_for_row = @letters[i]
            row = "".rjust(total_rows, @filler)
            row[i] = letter_for_row
            row
        end
    end
end